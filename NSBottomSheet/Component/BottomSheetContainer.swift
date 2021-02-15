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
    func nextBottomSheet(newBottomSheet:BottomSheetBase)
}

class BottomSheetContainer: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - Objects
    private var parentController:UIViewController?
    private var viewControllers:[BottomSheetBase] = []
    
    private var currentViewIndex = 0
    private let collapseRatio:CGFloat = 0.13
    private let overlayTag = 121
    var animationDuratioon = 0.5
    
    private var collapsedHeight:CGFloat {
        return self.view.frame.size.height / (1.0 / collapseRatio)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:- Instance Method
    init (fromController:UIViewController,initialView:BottomSheetBase) {
        super.init(nibName: nil, bundle: nil)
        self.parentController = fromController
        self.viewControllers = [initialView]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom Methods

    // MARK: - Action Methods
 
    //MARK:- Custom MEthods
    
    private func addViewInStack(currentView:UIView,index:Int,animate:Bool)  {
        if animate {
            currentView.frame = getBeforeExtendedFrame(index: index)
        }
        else{
            currentView.frame = getExpendedFrame(index: index)
        }
        
        //OverLay
        let overlayView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: currentView.frame.size.height))
        
        overlayView.tag = 121 // OverlayTags
        overlayView.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.2117647059, blue: 0.2823529412, alpha: 0.2)
        overlayView.isHidden = true
        
        //UIImage
        let expendImage = UIImageView.init(frame: CGRect.init(x: overlayView.frame.size.width - 40, y: (collapsedHeight - 20) / 2, width: 20, height: 20))
        expendImage.image = UIImage(named: "expendIcon")
        
        overlayView.addSubview(expendImage)
        currentView.addSubview(overlayView)
        
        currentView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        currentView.layer.cornerRadius = 20
        currentView.clipsToBounds = true
        currentView.tag = encodeTag(index: currentViewIndex)
        addSwipe(view: currentView)
        self.view.addSubview(currentView)
        
        if animate {
            if let previousView = self.view.viewWithTag(encodeTag(index: currentViewIndex - 1)), let overLayPrevious = previousView.viewWithTag(overlayTag) {
                overLayPrevious.alpha = 0
                UIView.animate(withDuration: animationDuratioon) {
                    overLayPrevious.alpha = 1
                    overLayPrevious.isHidden = false
                }
            }
            
            UIView.animate(withDuration: animationDuratioon) {
                currentView.frame = self.getExpendedFrame(index: index)
            }
        }
    }
    
    func encodeTag(index:Int) -> Int {
        return ((index + 121) * 223)
    }
    
    func decodeTag(encoded:Int) -> Int {
        return (encoded / 223) - 121
    }
    
    func getExpendedFrame(index:Int) -> CGRect {
        var newFrame = viewControllers[index].view.frame
        newFrame.origin.x = 0
        newFrame.origin.y = (collapsedHeight * CGFloat((index + 1)))
        newFrame.size.height = self.view.frame.size.height - (collapsedHeight * CGFloat((index + 1)))
        newFrame.size.width = self.view.frame.size.width
        return newFrame
    }
    
    func getBeforeExtendedFrame(index:Int) -> CGRect {
        var newFrame = viewControllers[index].view.frame
        newFrame.origin.x = 0
        newFrame.origin.y = self.view.frame.size.height
        newFrame.size.height = self.view.frame.size.height - (collapsedHeight * CGFloat((index + 1)))
        newFrame.size.width = self.view.frame.size.width
        return newFrame
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
        
        if let firstView = viewControllers.first?.view {
            addViewInStack(currentView: firstView, index: currentViewIndex, animate: false)
        }
        
        //Presenting Animation
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.frame = self?.presentFrameValue() ?? .zero
            self?.backgroundView.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.2117647059, blue: 0.2823529412, alpha: 0.7501484448)
        }
    }
    
    func nextViewInitiate()  {
        if currentViewIndex < (viewControllers.count - 1) {
            currentViewIndex = currentViewIndex + 1
            
        }
        else{
            dismiss()
        }
    }
    
    func showOverLay(index:Int)  {
        if let previousView = self.view.viewWithTag(encodeTag(index: index)), let overLayPrevious = previousView.viewWithTag(121) {
            UIView.animate(withDuration: animationDuratioon) {
                overLayPrevious.alpha = 0
            } completion: { _ in
                overLayPrevious.isHidden = true
            }
        }
    }
    
    func removeOverLay(currentView:UIView) {
        if let overLay = currentView.viewWithTag(overlayTag) {
            overLay.removeFromSuperview()
        }
    }
    
    @IBAction func closeBottomSheet(_ sender: UIButton) {
        dismiss()
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.frame = self?.dismisFrameValue() ?? .zero
            self?.backgroundView.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.2117647059, blue: 0.2823529412, alpha: 0)
        } completion: { [weak self] _ in
            
            self?.currentViewIndex = 0
            var decodedIndex = 0
            
            while let currentView = self?.self.view?.viewWithTag(((decodedIndex + 121) * 223)){
                self?.removeOverLay(currentView: currentView)
                    currentView.removeFromSuperview()
                decodedIndex = decodedIndex + 1
            }
            
            self?.view.removeFromSuperview()
        }
    }
    
    func dismissView(index:Int) {
        
        if decodeTag(encoded: index) != currentViewIndex {
            return
        }
        
        if decodeTag(encoded: index) == 0 {
            dismiss()
        }
        else{
            if let currentView = self.view.viewWithTag(index){
                var currentFrame = currentView.frame
                currentFrame.origin.y = self.view.frame.size.height
                UIView.animate(withDuration: animationDuratioon) {
                    currentView.frame = currentFrame
                } completion: { _ in
                    self.removeOverLay(currentView: currentView)
                    currentView.removeFromSuperview()
                }
                self.currentViewIndex = self.currentViewIndex - 1
            }
            
            showOverLay(index: decodeTag(encoded: index) - 1)
        }
    }
    
    func expendViewOnTap(index:Int) {
        var decodedIndex = decodeTag(encoded: index)
        if decodedIndex == currentViewIndex {
            return
        }
        
        showOverLay(index: decodedIndex)
        
        while let currentView = self.view.viewWithTag((((decodedIndex + 1) + 121) * 223)){
            self.currentViewIndex = self.currentViewIndex - 1
            var currentFrame = currentView.frame
            currentFrame.origin.y = self.view.frame.size.height
            UIView.animate(withDuration: animationDuratioon) {
                currentView.frame = currentFrame
            } completion: { _ in
                self.removeOverLay(currentView: currentView)
                currentView.removeFromSuperview()
            }
            decodedIndex = decodedIndex + 1
        }
    }
    
    private func dismisFrameValue() -> CGRect {
        return  CGRect(x: 0, y: view.frame.size.height , width: view.frame.size.width, height: view.frame.size.height)
    }
    
    private func presentFrameValue() -> CGRect {
        return  CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
}

//MARK:- Down & Left Guesture
extension BottomSheetContainer
{
    func addSwipe(view:UIView) {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        gesture.direction = .down
        gesture.name = "\(view.tag)"
        view.addGestureRecognizer(gesture)
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .right
        edgePan.name = "\(view.tag)"
        view.addGestureRecognizer(edgePan)
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(tapGuestureTrigger))
        tapGuesture.numberOfTouchesRequired = 1
        tapGuesture.name = "\(view.tag)"
        view.addGestureRecognizer(tapGuesture)
        
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .down {
            dismissView(index: Int(sender.name ?? "0")!)
        }
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.edges == .right {
            dismiss()
        }
    }
    
    @objc func tapGuestureTrigger(sender: UITapGestureRecognizer) {
            expendViewOnTap(index:  Int(sender.name ?? "0")!)
    }
}

extension UIView{
    func constraintWith(identifier: String) -> NSLayoutConstraint?{
        return self.constraints.first(where: {$0.identifier == identifier})
    }
}
//MARK:- BottomSheetDelegate 
extension BottomSheetContainer : BottomSheetDelegate {
    func nextBottomSheet(newBottomSheet: BottomSheetBase) {
        
    }
}
