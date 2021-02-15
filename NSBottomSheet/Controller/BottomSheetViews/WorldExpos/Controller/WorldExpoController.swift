//
//  WorldExpoController.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class WorldExpoController: UIBottomSheet {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Objects
    var expoHistoryArray:[ExpoHistoryModel] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVariables()
    }

    // MARK: - Custom Methods
    func initializeVariables() {
        setupData()
        collectionView.register(UINib.init(nibName: "ExpoHistoryCell", bundle: nil), forCellWithReuseIdentifier:"ExpoHistoryCell")
    }

    // MARK: - Action Methods
    @IBAction func nextButtonAction(_ sender: Any) {
        let upcomingExpoVC = UpcomingExpoController.init()
        bottomSheetNavigation?.present(newBottomSheet: upcomingExpoVC)
    }
}

//AMRK:- UIBottomSheet CallBack
extension WorldExpoController : UIBottomSheetDelegate
{
    func bottomSheetStateChange(newState: BottomSheetState) {
        switch state {
        case .closed:
            print("Upcoming Event Sheet Closed")
        case .collapsed:
            print("Upcoming Event Sheet Collapesd")
        case .expended:
            print("Upcoming Event Sheet Expended")
        case .launch:
            print("launch")
        }
    }
}

//MARK:- COllectionView Delegate
extension WorldExpoController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //MARK:- CollectionView Delegate & Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expoHistoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let expoHistoryCell:ExpoHistoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpoHistoryCell", for: indexPath) as!  ExpoHistoryCell
        expoHistoryCell.configureCell(model:expoHistoryArray[indexPath.row])
        return expoHistoryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width - 40, height: 200)
    }
    
}
