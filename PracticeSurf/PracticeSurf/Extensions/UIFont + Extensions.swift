//
//  UIFont + Extensions.swift
//  PracticeSurf
//
//  Created by Элина Абдрахманова on 01.08.2023.
//

import UIKit

extension UIFont {
    
    static func systemFontBold16() -> UIFont? {
        UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    static func systemFontBold24() -> UIFont? {
        UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    static func systemFontRegular14() -> UIFont? {
        UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    static func systemFontMedium16() -> UIFont? {
        UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
}
