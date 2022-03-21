//
//  CGFloatExtension.swift
//  TheBean
//
//  Created by Илья Чуб on 17.03.2022.
//

import UIKit

extension CGFloat {
    var goldenRatioCompotents: (a: CGFloat, b: CGFloat) {
        // swiftlint:disable identifier_name
        let a = self / Double.phi
        // swiftlint:enable identifier_name
        return (a, self - a)
    }
}
