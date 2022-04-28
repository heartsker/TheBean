//
//  CGFloatExtension.swift
//  TheBean
//
//  Created by Ilya Chub on 17.03.2022.
//
import CoreGraphics

extension CGFloat {
    static func goldenRatioMultiplier(trailing: Bool = false) -> CGFloat {
        // swiftlint:disable identifier_name
        let a = 1 / Double.phi
        // swiftlint:enable identifier_name
        return trailing ? a : 1 - a
    }
}
