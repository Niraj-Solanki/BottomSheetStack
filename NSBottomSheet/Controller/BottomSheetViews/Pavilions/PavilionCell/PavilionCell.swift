//
//  PavilionCell.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 16/02/21.
//

import UIKit

class PavilionCell: UICollectionViewCell {

    //MARK:- Outlets
    @IBOutlet weak var pavilionImageView: UIImageView!
    @IBOutlet weak var pavilionTitleLabel: UILabel!

    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:- Custom Methods
    func configureCell() {
    }

}
