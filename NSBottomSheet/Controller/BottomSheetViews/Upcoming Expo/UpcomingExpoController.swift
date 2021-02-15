//
//  UpcomingExpoController.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class UpcomingExpoController: UIBottomSheet {

    // MARK: - Outlets
    
    // MARK: - Objects
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Custom Methods

    // MARK: - Action Methods
    @IBAction func nextButtonAction(_ sender: Any) {
        let pavalionsVC = PavalionsController()
        bottomSheetNavigation?.present(newBottomSheet: pavalionsVC)
    }
}