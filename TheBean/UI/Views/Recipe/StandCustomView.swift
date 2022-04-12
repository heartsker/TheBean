//
//  StandCustomView.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import UIKit

final class StandCustomView: UIView {
    var fillColor: UIColor = .materialMedium

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }

    convenience init(frame: CGRect, fillColor: UIColor) {
        self.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
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

    override func draw(_ rect: CGRect) {
        let path = createBezierPath()
        fillColor.setFill()
        path.apply(.init(scaleX: self.frame.width/130, y: self.frame.height/58))
        path.fill()
    }
}
