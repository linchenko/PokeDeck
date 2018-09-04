//
//  Theme.swift
//  DeckOfCards
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

extension UIView {
    
    /*
     Adds a vertical gradient layer with two **UIColors** to the **UIView**.
     - Parameter topColor: The top **UIColor**.
     - Parameter bottomColor: The bottom **UIColor**.
     */
    
    func addVerticalGradientLayer(topColor:UIColor, bottomColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    
}

extension UIColor{
    static let pockerGreen = #colorLiteral(red: 0.3088331169, green: 0.7585613666, blue: 0, alpha: 1)
}
