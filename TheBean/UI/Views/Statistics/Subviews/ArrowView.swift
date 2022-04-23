//
//  ArrowView.swift
//  TheBean
//
//  Created by Илья Чуб on 08.04.2022.
//

import UIKit
import AdvancedGraphics
import AssetsManager

class ArrowView: UIView {

    // MARK: - Properties
    private let color: UIColor
    private let width: Double
    private let pointerLineLength: Double
    private let arrowAngle: Double

    // MARK: - Initializers
    init() {
        self.color = Pallete.materialMedium
        self.width = 1
        self.pointerLineLength = 5
        self.arrowAngle = CGFloat(Double.pi / 4) * 0.9
        super.init(frame: .zero)
    }

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

// MARK: - Setup methods
extension ArrowView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.arrow(from: CGPoint(x: rect.origin.x, y: rect.midY),
                       to: CGPoint(x: rect.maxX,
                                    y: rect.midY),
                       pointerLength: pointerLineLength,
                       angle: CGFloat(arrowAngle))
        let layer = CAShapeLayer()
        layer.strokeColor = color.cgColor
        layer.lineWidth = CGFloat(width)
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineJoin = CAShapeLayerLineJoin.round
        layer.lineCap = CAShapeLayerLineCap.round
        self.layer.addSublayer(layer)
    }
}
