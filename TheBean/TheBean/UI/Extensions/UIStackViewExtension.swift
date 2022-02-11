//
//  UIStackViewExtension.swift
//  TheBean
//
//  Created by Alina on 11.02.2022.
//

import UIKit

extension UIStackView {
    func insertCustomizedViewIntoStack(background: UIColor, cornerRadius: CGFloat) {
        let subView = UIView(frame: bounds)
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subView.layer.masksToBounds = true
        subView.clipsToBounds = true
        subView.layer.cornerRadius = cornerRadius
        subView.backgroundColor = background
    }
}
