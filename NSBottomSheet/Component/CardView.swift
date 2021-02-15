//
//  CardView.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 16/02/21.
//
//
import UIKit

@IBDesignable class CardView: UIView {
    
    var cornnerRadius : CGFloat = 3
       var shadowOfSetWidth : CGFloat = 1
       var shadowOfSetHeight : CGFloat = 1
       var shadowColour : UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
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

@IBDesignable class CardViewRadius: UIView {
   
}
