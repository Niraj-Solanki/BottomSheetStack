//
//  PavalionsController.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class PavalionsController: UIBottomSheet {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Objects
    var pavilionsArray:[PavilionModel] = []
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVariables()
    }

    // MARK: - Custom Methods
    func initializeVariables() {
        setUpData()
        collectionView.register(UINib.init(nibName: "PavilionCell", bundle: nil), forCellWithReuseIdentifier:"PavilionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - Action Methods
    @IBAction func nextButtonAction(_ sender: Any) {
        let bookTicket = BookTicketController()
        bottomSheetNavigation?.present(newBottomSheet: bookTicket)
    }
}


//MARK:- COllectionView Delegate
extension PavalionsController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //MARK:- CollectionView Delegate & Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pavilionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pavilionCell:PavilionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PavilionCell", for: indexPath) as!  PavilionCell
        pavilionCell.configureCell(model:pavilionsArray[indexPath.row])
        return pavilionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width - 30, height: 200)
    }
    
}
