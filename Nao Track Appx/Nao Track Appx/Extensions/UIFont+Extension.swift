//
//  UIFont+Extension.swift
//  Nao Track Appx
//
//  Created by Pole Star on 24/11/2021.
//

import UIKit

extension UIFont {
    static func systemFont(ofSize: CGFloat, weight: UIFont.Weight, traits: UIFontDescriptor.SymbolicTraits) -> UIFont? {
         let font = UIFont.systemFont(ofSize: ofSize, weight: weight)

         if let descriptor = font.fontDescriptor.withSymbolicTraits(traits) {
             return UIFont(descriptor: descriptor, size: ofSize)
         }

         return nil
     }
}
