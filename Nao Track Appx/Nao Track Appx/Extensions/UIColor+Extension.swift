//
//  UIColor+Extension.swift
//  Nao Track Appx
//
//  Created by Pole Star on 24/11/2021.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat)-> UIColor {
        return UIColor (red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBlue = UIColor.rgb(red: 0, green: 150, blue: 255)
    
    static let bluePolestar = UIColor (red: 0.023529411760000001, green: 0.48627450979999998, blue: 0.63921568630000003, alpha: 1)
    
    static let borderBluePolestar = UIColor (red: 0.023529411760000001, green: 0.48627450979999998, blue: 0.63921568630000003, alpha: 0.5)
    
}
