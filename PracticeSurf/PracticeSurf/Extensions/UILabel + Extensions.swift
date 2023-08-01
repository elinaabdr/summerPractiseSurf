//
//  UILabel + Extensions.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String = "",
                     font: UIFont?,
                     textColor: UIColor,
                     alignment: NSTextAlignment,
                     numberOfLines: Int) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
