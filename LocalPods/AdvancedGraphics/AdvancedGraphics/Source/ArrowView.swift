//
//  ArrowView.swift
//  AdvancedGraphics
//
//  Created by Daniel Pustotin on 24.04.2022.
//

import AssetsManager

/// View with arrow
public class ArrowView: UIView {

    // MARK: - Properties
    private let color: UIColor
    private let width: Double
    private let pointerLineLength: Double
    private let arrowAngle: Double

    // MARK: - Initializers

    /// Default init
    public convenience init() {
        self.init(color: Pallete.materialMedium, width: 1, pointerLineLength: 5, arrowAngle: 1)
    }

    private init(color: UIColor,
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

    // MARK: - Methods

    /// Method to draw the arrow in the view
    /// - Parameter rect: Rect to draw arrow in
    public override func draw(_ rect: CGRect) {
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
