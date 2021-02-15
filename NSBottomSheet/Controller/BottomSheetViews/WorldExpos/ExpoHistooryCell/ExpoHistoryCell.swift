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
        eventImageView.layer.borderWidth = 0.5
        eventImageView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    //MARK:- Custom Methods
    func configureCell(model:ExpoHistoryModel) {
        eventImageView.image = UIImage(named: model.expoImageName ?? "home")
        eventYearLabel.text = model.expoYear
        eventTitleLabel.text = model.expoTitle
        eventDescriptionLabel.text = model.expeDescription
    }

}
