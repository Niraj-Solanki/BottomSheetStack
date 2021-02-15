//
//  HomeViewController.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Objects
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Custom Methods

    // MARK: - Action Methods
    @IBAction func exploreWorldAction(_ sender: Any) {
        let worldExpoVC = WorldExpoController()
        let bottomSheetContainer = BottomSheetContainer.init(fromController: self, bottomSheet: worldExpoVC)
        bottomSheetContainer.present()
    }
    
}
