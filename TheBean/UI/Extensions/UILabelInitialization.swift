//
//  UILabelExtension.swift
//  TheBean
//
//  Created by Alina on 12.02.2022.
//
import UIKit.UILabel

extension UILabel {
    convenience init(text: String, color: UIColor, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = color
        self.font = font
    }
}
