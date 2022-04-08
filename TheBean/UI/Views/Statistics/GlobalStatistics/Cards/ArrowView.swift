//
//  ArrowView.swift
//  TheBean
//
//  Created by Илья Чуб on 08.04.2022.
//

import UIKit

// MARK: ArrowView
class ArrowView: UIView {

    // MARK: - Properties
    let color: UIColor
    let width: Double
    let pointerLineLength: Double
    let arrowAngle: Double

    // MARK: - Initializers
    init(
        color: UIColor,
        width: Double,
        pointerLineLength: Double,
        arrowAngle: Double
    ) {
        self.color = color
        self.width = width
        self.pointerLineLength = pointerLineLength
        self.arrowAngle = arrowAngle
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup methods
extension ArrowView {
    override func draw(_ rect: CGRect) {
        drawArrow(rect)
    }

    private func drawArrow(_ rect: CGRect) {
        let arrow = UIBezierPath()
        arrow.addArrow(start: CGPoint(x: rect.origin.x, y: rect.midY),
                       end: CGPoint(x: rect.maxX,
                                    y: rect.midY),
                       pointerLineLength: pointerLineLength,
                       arrowAngle: CGFloat(arrowAngle))
        let arrowLayer = CAShapeLayer()
        arrowLayer.strokeColor = color.cgColor
        arrowLayer.lineWidth = CGFloat(width)
        arrowLayer.path = arrow.cgPath
        arrowLayer.fillColor = UIColor.clear.cgColor
        arrowLayer.lineJoin = CAShapeLayerLineJoin.round
        arrowLayer.lineCap = CAShapeLayerLineCap.round
        layer.addSublayer(arrowLayer)
    }
}
