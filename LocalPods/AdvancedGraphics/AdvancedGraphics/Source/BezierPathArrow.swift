//
//  BezierPathArrow.swift
//  TheBean
//
//  Created by Илья Чуб on 07.04.2022.
//

import UIKit

public extension UIBezierPath {
    func arrow(
        from: CGPoint,
        to: CGPoint,
        pointerLength: CGFloat,
        angle: CGFloat
    ) {
        self.move(to: from)
        self.addLine(to: to)

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
        self.addLine(to: arrowLine1)
        self.move(to: to)
        self.addLine(to: arrowLine2)
    }
}
