//
//  GoldenRatioConstraints.swift
//  TheBean
//
//  Created by Daniel Pustotin on 21.03.2022.
//

import UIKit
import SnapKit

extension ConstraintMaker {

    enum Direction {
        // swiftlint:disable identifier_name
        case X
        case Y
        // swiftlint:enable identifier_name
    }

    @discardableResult
    func goldenRatio(from other: ConstraintItem,
                     in direction: Direction,
                     size: CGFloat,
                     bigger: Bool = false) -> ConstraintMakerEditable {
        switch direction {
        case .X:
            return centerX.equalTo(other)
                .offset(bigger ? size.goldenRatioCompotents.a : size.goldenRatioCompotents.b)
        case .Y:
            return centerY.equalTo(other)
                .offset(bigger ? size.goldenRatioCompotents.a : size.goldenRatioCompotents.b)
        }
    }
}
