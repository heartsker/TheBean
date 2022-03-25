//
//  TestVC.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import UIKit
import SnapKit

class TestVC: UIViewController, IBaseView {
    // MARK: - Properties
    private lazy var label: UIView = {
        let label = UILabel()
        label.text = AppLocalization.name
        return label
    }()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup
    func setupSubviews() {
        view.addSubview(label)
    }

    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}
