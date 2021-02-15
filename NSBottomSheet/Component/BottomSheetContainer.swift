//
//  BottomSheetContainer.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit
// Bottom Sheet States
enum BottomSheetState {
    case launch
    case collapsed
    case expended
    case closed
}

// Bottom Sheet Delegate
protocol BottomSheetDelegate {
    func present(newBottomSheet:UIBottomSheet)
    func dismiss()
}

protocol UIBottomSheetDelegate {
    func bottomSheetStateChange(newState:BottomSheetState)
}

extension UIBottomSheetDelegate{
    func bottomSheetStateChange(newState:BottomSheetState){}
}

class BottomSheetContainer: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - Objects
    private var parentController:UIViewController?
    private var initialSheet:UIBottomSheet?
    private var bottomSheetArray:[UIBottomSheet] = []
    
    private var currentViewIndex = 0
    private let collapseRatio:CGFloat = 0.13
    private let overlayTag = 121
    private let tagModifier = 1000
    var animationDuratioon = 0.5
    
    private var collapsedHeight:CGFloat {
        return self.view.frame.size.height / (1.0 / collapseRatio)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:- Instance Method
    init (fromController:UIViewController,bottomSheet:UIBottomSheet) {
        super.init(nibName: nil, bundle: nil)
        self.parentController = fromController
        self.initialSheet = bottomSheet
        self.initialSheet?.state = .launch
        bottomSheet.bottomSheetNavigation = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
 
    //MARK:- Action Methods
    @IBAction func closeBottomSheet(_ sender: UIButton) {
        dismissAll()
    }
    
    //MARK:- Custom MEthods
    private func addViewInStack(bottomSheet:UIBottomSheet,index:Int,animate:Bool)  {
        view.layoutIfNeeded()
        let calculatedHeight = self.view.frame.size.height - (collapsedHeight * CGFloat((index + 1)))
        
        bottomSheet.view.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: calculatedHeight)
        
        addOverlay(bottomSheet: bottomSheet)
        
        bottomSheet.view.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        bottomSheet.view.layer.cornerRadius = 20
        bottomSheet.view.clipsToBounds = true
        bottomSheet.view.tag = tagModifier + currentViewIndex
        addSwipe(view: bottomSheet.view)
        
        self.view.addSubview(bottomSheet.view)
        
        UIView.animate(withDuration: animationDuratioon) {
            bottomSheet.view.frame = CGRect(x: 0, y: (self.collapsedHeight * CGFloat((index + 1))), width: self.view.frame.size.width, height: calculatedHeight)
        }
        
        if currentViewIndex > 0 {
            let previousBottomSheet = bottomSheetArray[currentViewIndex - 1]
            bottomSheetArray[currentViewIndex - 1].state = .collapsed
            updateUI(bottomSheet: previousBottomSheet)
        }
    }
    
    func present() {
        
        guard let parentController = parentController else { return  }
        
        //Add Currrent Controller to Parent as Child
        parentController.addChild(self)
        parentController.view.addSubview(self.view)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.view.leadingAnchor.constraint(equalTo: parentController.view.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: parentController.view.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: parentController.view.bottomAnchor),
            self.view.topAnchor.constraint(equalTo: parentController.view.topAnchor)
        ])
        self.didMove(toParent: self)
        self.view.frame = self.dismisFrameValue()
        
        //First Screen
        updateUI(bottomSheet: initialSheet)
        
        //Presenting Animation
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.frame = self?.presentFrameValue() ?? .zero
            self?.backgroundView.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.2117647059, blue: 0.2823529412, alpha: 0.7501484448)
        }
    }
    
    func updateUI(bottomSheet:UIBottomSheet?) {
        guard let bottomSheet = bottomSheet else { return }
        
        switch bottomSheet.state {
        case .launch:
            bottomSheet.bottomSheetNavigation = self
            bottomSheetArray.append(bottomSheet)
            currentViewIndex = bottomSheetArray.count - 1
            addViewInStack(bottomSheet: bottomSheet, index: currentViewIndex, animate: true)
        case .collapsed:
            isHideOverlay(bottomSheet: bottomSheet, isHide: false)
        case .expended:
            isHideOverlay(bottomSheet: bottomSheet, isHide: true)
        case .closed:
            dismissSheet(bottomSheet)
        }
    }
    
    func dismissAll() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.frame = self?.dismisFrameValue() ?? .zero
            self?.backgroundView.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.2117647059, blue: 0.2823529412, alpha: 0)
        } completion: { [weak self] _ in
            
            while self?.bottomSheetArray.count != 0
            {
                if let bottomSheet = self?.bottomSheetArray.first{
                    bottomSheet.state = .closed
                    self?.updateUI(bottomSheet: bottomSheet)
                }
            }
        }
    }
    
    //Dismiss Sheet
    func dismissSheet(_ bottomSheet:UIBottomSheet) {
        
        var currentFrame = bottomSheet.view.frame
        currentFrame.origin.y = self.view.frame.size.height
        UIView.animate(withDuration: animationDuratioon) {
            bottomSheet.view.frame = currentFrame
        } completion: { [weak self] _ in
            self?.removeOverlay(bottomSheet: bottomSheet)
            bottomSheet.view.removeFromSuperview()
        }
        
        bottomSheetArray.removeAll { (sheet) -> Bool in
            return sheet.view.tag == bottomSheet.view.tag
        }
    }
    
    func expendViewOnTap(index:Int) {
       var currentIndex = index % tagModifier
         
        if currentIndex == currentViewIndex {
            return
        }
        
        if bottomSheetArray.count > currentIndex {
            bottomSheetArray[currentIndex].state = .expended
            updateUI(bottomSheet: bottomSheetArray[currentIndex])
        }
        
        currentIndex = currentIndex + 1
        
        while currentIndex < bottomSheetArray.count {
            if bottomSheetArray.count > currentIndex {
                bottomSheetArray[currentIndex].state = .closed
                updateUI(bottomSheet: bottomSheetArray[currentIndex])
            }
        }
        
        currentViewIndex = bottomSheetArray.count - 1
    }
    
    private func dismisFrameValue() -> CGRect {
        return  CGRect(x: 0, y: view.frame.size.height , width: view.frame.size.width, height: view.frame.size.height)
    }
    
    private func presentFrameValue() -> CGRect {
        return  CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
}

//MARK:- Overlay WOrk
extension BottomSheetContainer{
    func addOverlay(bottomSheet:UIBottomSheet) {
        //OverLay
        let overlayView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: bottomSheet.view.frame.size.height))
        
        overlayView.tag = 121 // OverlayTags
        overlayView.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.2117647059, blue: 0.2823529412, alpha: 0.2)
        overlayView.isHidden = true
        
        //UIImage
        let expendImage = UIImageView.init(frame: CGRect.init(x: overlayView.frame.size.width - 40, y: (collapsedHeight - 20) / 2, width: 20, height: 20))
        expendImage.image = UIImage(named: "expendIcon")
        
        overlayView.addSubview(expendImage)
        bottomSheet.view.addSubview(overlayView)
    }
    
    func removeOverlay(bottomSheet:UIBottomSheet) {
        if let overlayView = bottomSheet.view.viewWithTag(overlayTag) {
            overlayView.removeFromSuperview()
        }
    }
    
    func isHideOverlay(bottomSheet:UIBottomSheet,isHide:Bool) {
        if let overlayView = bottomSheet.view.viewWithTag(overlayTag) {
            overlayView.alpha = (isHide) ? 1 : 0
            if !isHide {
                overlayView.isHidden = isHide
            }
            
            UIView.animate(withDuration: animationDuratioon) {
                overlayView.alpha = (isHide) ? 0 : 1
            } completion: { _ in
                overlayView.isHidden = isHide
            }
        }
    }
}

//MARK:- Down & Tap Guesture
extension BottomSheetContainer
{
    func addSwipe(view:UIView) {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        gesture.direction = .down
        gesture.name = "\(view.tag)"
        view.addGestureRecognizer(gesture)
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(tapGuestureTrigger))
        tapGuesture.numberOfTouchesRequired = 1
        tapGuesture.name = "\(view.tag)"
        view.addGestureRecognizer(tapGuesture)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .down {
            
            if currentViewIndex == 0 {
                dismissAll()
            }
            else if let swipeIndex = Int(sender.name ?? "0") {
                if swipeIndex % tagModifier == currentViewIndex && bottomSheetArray.count > currentViewIndex{
                    let bottomSheetPrevious = bottomSheetArray[currentViewIndex - 1]
                    bottomSheetPrevious.state = .expended
                    updateUI(bottomSheet: bottomSheetPrevious)
                    
                    let bottomSheet = bottomSheetArray[currentViewIndex]
                    bottomSheet.state = .closed
                    updateUI(bottomSheet: bottomSheet)
                    currentViewIndex = currentViewIndex - 1
                }
            }
        }
    }
    
    @objc func tapGuestureTrigger(sender: UITapGestureRecognizer) {
            expendViewOnTap(index:  Int(sender.name ?? "0")!)
    }
}

//MARK:- BottomSheetDelegate 
extension BottomSheetContainer : BottomSheetDelegate {
    
    func present(newBottomSheet: UIBottomSheet) {
        newBottomSheet.state = .launch
        updateUI(bottomSheet: newBottomSheet)
    }
    
    func dismiss() {
        if bottomSheetArray.count > 0 && currentViewIndex == 0{
            dismissAll()
        }
        else if bottomSheetArray.count > 0 {
            // Dismised Last
            if let bottomSheet = bottomSheetArray.last{
                bottomSheet.state = .closed
                updateUI(bottomSheet: bottomSheet)
            }
            
            //Expend 2nd Last
            currentViewIndex = currentViewIndex - 1
            if let bottomSheet = bottomSheetArray.last{
                bottomSheet.state = .expended
                updateUI(bottomSheet: bottomSheet)
            }
        }
        
    }
}
