//
//  CoolVC.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

import UIKit

final class CoolVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let customview = StandCustomView()
        customview.frame = .init(x: 100, y: 100, width: 130, height: 58)
        customview.backgroundColor = .clear
        view.addSubview(customview)
    }
}
