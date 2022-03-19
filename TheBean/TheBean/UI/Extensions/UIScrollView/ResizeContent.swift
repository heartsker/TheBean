//
//  ResizeContent.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import UIKit

extension UIScrollView {
    func resizeContent() {
        let contentRect: CGRect = subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentSize = contentRect.size
    }
}
