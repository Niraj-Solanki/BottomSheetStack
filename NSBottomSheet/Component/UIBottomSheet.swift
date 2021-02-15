//
//  BottomSheetBase.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

class UIBottomSheet: UIViewController {
    var state:BottomSheetState = .closed{
        didSet {
            if let callBackProtocol = self as? UIBottomSheetDelegate {
                callBackProtocol.bottomSheetStateChange(newState: state)
            }
        }
    }
    
    var bottomSheetNavigation:BottomSheetDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
