//
//  BookTicketController.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class BookTicketController: UIBottomSheet {

    // MARK: - Outlets
    
    // MARK: - Objects
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Custom Methods

    // MARK: - Action Methods
    @IBAction func nextButtonAction(_ sender: Any) {
        bottomSheetNavigation?.dismiss()
    }
    
    @IBAction func visitSiteAction(_ sender: UIButton) {
        if let url = URL(string: "https://www.expo2020dubai.com/en/support/faq?#Ticketing") {
            UIApplication.shared.open(url)
        }
    }
    
}
