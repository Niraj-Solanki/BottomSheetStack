//
//  ExpoHistoryCell.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 16/02/21.
//

import UIKit

class ExpoHistoryCell: UICollectionViewCell {

    //MARK:- Outlets
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventYearLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        eventImageView.layer.borderWidth = 1
        eventImageView.layer.borderColor = #colorLiteral(red: 0.1242638305, green: 0.1330408752, blue: 0.2081691623, alpha: 1)
    }
    
    //MARK:- Custom Methods
    func configureCell() {
    }

}
