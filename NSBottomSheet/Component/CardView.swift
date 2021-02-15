//
//  CardView.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 16/02/21.
//
//
import UIKit

 class CardView: UIView {
    
    var cornnerRadius : CGFloat = 5
       var shadowOfSetWidth : CGFloat = 1
       var shadowOfSetHeight : CGFloat = 1
       var shadowColour : UIColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
       var shadowOpacity : CGFloat = 0.3
       
       override func layoutSubviews() {
           layer.cornerRadius = cornnerRadius
           layer.shadowColor = shadowColour.cgColor
           layer.shadowOffset = CGSize(width: shadowOfSetWidth, height: shadowOfSetHeight)
           let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornnerRadius)
           layer.shadowPath = shadowPath.cgPath
           layer.shadowOpacity = Float(shadowOpacity)
       }
}
