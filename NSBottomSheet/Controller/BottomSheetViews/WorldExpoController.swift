//
//  WorldExpoController.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class WorldExpoController: UIBottomSheet {

    // MARK: - Outlets
    
    // MARK: - Objects
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Custom Methods

    // MARK: - Action Methods
    @IBAction func nextButtonAction(_ sender: Any) {
        let upcomingExpoVC = UpcomingExpoController.init()
        bottomSheetNavigation?.present(newBottomSheet: upcomingExpoVC)
    }
}

//AMRK:- UIBottomSheet CallBack
extension UpcomingExpoController : UIBottomSheetDelegate
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
        print("Upcoming Event Sheet Launched")
        }
    }
}
