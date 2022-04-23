//
//  BezierPathArrow.swift
//  AdvancedGraphics
//
//  Created by Илья Чуб on 07.04.2022.
//

import UIKit

extension UIBezierPath {
    func arrow(
        from: CGPoint,
        to: CGPoint,
        pointerLength: CGFloat,
        angle: CGFloat
    ) {
        move(to: from)
        addLine(to: to)

        let startEndAngle = atan(
            (to.y - from.y) / (to.x - from.x)) + ((to.x - from.x) < 0 ? CGFloat(Double.pi) : 0
        )
        let arrowLine1 = CGPoint(
            x: to.x
                + pointerLength
                * cos(CGFloat(Double.pi) - startEndAngle + angle),
            y: to.y
                - pointerLength
                * sin(CGFloat(Double.pi) - startEndAngle + angle)
        )
        let arrowLine2 = CGPoint(
            x: to.x
                + pointerLength
                * cos(CGFloat(Double.pi) - startEndAngle - angle),
            y: to.y
                - pointerLength
                * sin(CGFloat(Double.pi) - startEndAngle - angle)
        )
        addLine(to: arrowLine1)
        move(to: to)
        addLine(to: arrowLine2)
    }
}
