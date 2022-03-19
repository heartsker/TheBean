//
//  GlobalStatisticsCardLabel.swift
//  TheBean
//
//  Created by Илья Чуб on 17.03.2022.
//

import Foundation
import UIKit


class GlobalStatisticsCardLabel: UILabel {
    
    let labelText: String
    let isTextStyleDark: Bool
    
    init(labelText: String, isTextStyleDark: Bool) {
        self.labelText = labelText
        self.isTextStyleDark = isTextStyleDark
        super.init(frame: .zero)
        
        settings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settings() {
        setupSelf()
    }
    
    private func setupSelf() {
        self.textAlignment = .center
        self.numberOfLines = 0
        self.lineBreakMode = .byClipping
        self.attributedText = self.getAttributedString()
    }
    
    
    private func getAttributedString() -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self.labelText)
        attributedString.addAttribute(.font,
                                      value: UIFont(name: "Muller-Trial-Medium",
                                                    size: 16) ?? .systemFont(ofSize: 16),
                                      range: NSRange(self.labelText.startIndex ..< self.labelText.endIndex,
                                                     in: self.labelText))
        attributedString.addAttribute(.foregroundColor,
                                      value: self.isTextStyleDark ? UIColor.materialMedium : .white,
                                      range:  NSRange(self.labelText.startIndex ..< self.labelText.endIndex,
                                                      in: self.labelText))
        return attributedString
        
        
//        if
//
//
//        if let companyNameStartIndex = self.text.firstIndex(of: "T"){
//            attributedString.addAttribute(.foregroundColor,
//                                          value: UIColor.materialLight,
//                                          range: NSRange(self.text.startIndex ..< companyNameStartIndex, in: self.text))
//            attributedString.addAttribute(.foregroundColor,
//                                          value: UIColor.materialLight,
//                                          range: NSRange( self.text.startIndex ... self.text.index(companyNameStartIndex, offsetBy: 7),
//                                                          in: self.text))
//        }
    }
}
