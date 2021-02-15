//
//  PavalionsController.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class PavalionsController: UIBottomSheet {

    // MARK: - Outlets
    
    // MARK: - Objects
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Custom Methods

    // MARK: - Action Methods
    @IBAction func nextButtonAction(_ sender: Any) {
        let bookTicket = BookTicketController()
        bottomSheetNavigation?.present(newBottomSheet: bookTicket)
    }
    
}
