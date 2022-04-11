//
//  StandCustomView.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import UIKit

final class StandCustomView: UIView {
    var shapeLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    convenience init(frame: CGRect, fillColor: UIColor) {
        self.init(frame: frame)
        setup(fillColor)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        applyScale()
    }

    private func setup(_ color: UIColor = .materialHeavy) {
        let path = createBezierPath()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = color.cgColor
        shapeLayer.position = .zero
        layer.addSublayer(shapeLayer)
    }

    private func applyScale() {
        let path = createBezierPath()
        path.apply(.init(scaleX: self.frame.width/130, y: self.frame.height/58))
        shapeLayer.path = path.cgPath
    }

    private func createBezierPath() -> UIBezierPath {
        let path = UIBezierPath()

        path.move(to: .init(x: 6, y: 58))
        path.addQuadCurve(to: .init(x: 0, y: 52),
                          controlPoint: .init(x: 0, y: 58))
        path.addCurve(to: .init(x: 130, y: 52),
                      controlPoint1: .init(x: 15, y: -15),
                      controlPoint2: .init(x: 115, y: -15))
        path.addQuadCurve(to: .init(x: 124, y: 58),
                          controlPoint: .init(x: 130, y: 58))
        path.close()

        return path
    }
}
