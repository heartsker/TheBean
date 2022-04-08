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
    func goldenRatio(from other: ConstraintViewDSL,
                     in direction: Direction,
                     trailing: Bool = false) -> ConstraintMakerEditable {
        switch direction {
        case .X:
            return centerX.equalTo(other.trailing)
                .multipliedBy(CGFloat.goldenRatioMultiplier(trailing: trailing))
        case .Y:
            return centerY.equalTo(other.bottom)
                .multipliedBy(CGFloat.goldenRatioMultiplier(trailing: trailing))
        }
    }
}
