//
//  CGFloatExtension.swift
//  TheBean
//
//  Created by Илья Чуб on 17.03.2022.
//

import Foundation
import UIKit

extension CGFloat {
    var goldenRatioCompotents: (a: CGFloat, b: CGFloat) {
        let a = self / Double.phi
        return (a, self - a)
    }
}
