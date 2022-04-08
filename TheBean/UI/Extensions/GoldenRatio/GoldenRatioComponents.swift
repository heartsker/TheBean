//
//  CGFloatExtension.swift
//  TheBean
//
//  Created by Илья Чуб on 17.03.2022.
//

import UIKit

extension CGFloat {
    static func goldenRatioMultiplier(trailing: Bool = false) -> CGFloat {
        // swiftlint:disable identifier_name
        let a = 1 / Double.phi
        // swiftlint:enable identifier_name
        return trailing ? a : 1 - a
    }
}
