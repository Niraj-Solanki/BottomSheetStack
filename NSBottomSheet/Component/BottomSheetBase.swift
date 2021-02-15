//
//  BottomSheetBase.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 15/02/21.
//

import UIKit

protocol BottomSheetCallBack {
    func bottomSheetStateChange(newState:BottomSheetState)
}
extension BottomSheetCallBack{
    func bottomSheetStateChange(newState:BottomSheetState){}
}

class BottomSheetBase: UIViewController {

    var bottomSheetDelegate:BottomSheetDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
