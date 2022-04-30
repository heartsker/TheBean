//
//  UIButtonExtension.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.02.2022.
//
import UIKit.UIButton

extension UIButton {
    convenience init(text: String, color: UIColor, font: UIFont) {
        self.init()
        setTitle(text, for: .normal)
        setTitleColor(color, for: .normal)
        titleLabel?.font = font
    }
}
