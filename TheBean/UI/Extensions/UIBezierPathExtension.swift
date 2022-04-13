//
//  UIBezierPathExtension.swift
//  TheBean
//
//  Created by Илья Чуб on 07.04.2022.
//

import UIKit

extension UIBezierPath {
    func addArrow(
        start: CGPoint,
        end: CGPoint,
        pointerLineLength: CGFloat,
        arrowAngle: CGFloat
    ) {
        self.move(to: start)
        self.addLine(to: end)

        let startEndAngle = atan(
            (end.y - start.y) / (end.x - start.x)) + ((end.x - start.x) < 0 ? CGFloat(Double.pi) : 0
        )
        let arrowLine1 = CGPoint(
            x: end.x
                + pointerLineLength
                * cos(CGFloat(Double.pi) - startEndAngle + arrowAngle),
            y: end.y
                - pointerLineLength
                * sin(CGFloat(Double.pi) - startEndAngle + arrowAngle)
        )
        let arrowLine2 = CGPoint(
            x: end.x
                + pointerLineLength
                * cos(CGFloat(Double.pi) - startEndAngle - arrowAngle),
            y: end.y
                - pointerLineLength
                * sin(CGFloat(Double.pi) - startEndAngle - arrowAngle)
        )
        self.addLine(to: arrowLine1)
        self.move(to: end)
        self.addLine(to: arrowLine2)
    }
}
