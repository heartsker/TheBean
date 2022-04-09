//
//  TestVC.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import UIKit
import SnapKit
import Combine

class TestVC: UIViewController, IBaseView {
    // MARK: - Properties
    lazy private var usernameLabel: UILabel = {
        let label = UILabel(text: Account.shared.username, color: .blue, font: .bold(40))
        Publisher.subscribe(label, keyPath: \.text, for: .usernamePost)
        return label
    }()
    lazy private var buttonCom: UIButton = {
        let button = UIButton()
        button.setTitle("Make .com", for: .normal)
        button.addTarget(self, action: #selector(makeCom), for: .touchUpInside)
        //        button.backgroundColor = .red
        return button
    }()
    @objc func makeCom() {
        Account.shared.username = "heartsker.com"
    }
    lazy private var buttonRu: UIButton = {
        let button = UIButton()
        button.setTitle("Make .ru", for: .normal)
        button.addTarget(self, action: #selector(makeRu), for: .touchUpInside)
        //        button.backgroundColor = .blue
        return button
    }()
    @objc func makeRu() {
        Account.shared.username = "heartsker.ru"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup
    func setupSubviews() {
        view.addSubview(usernameLabel)
        view.addSubview(buttonRu)
        view.addSubview(buttonCom)
    }

    func setupConstraints() {
        usernameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }

        buttonRu.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(usernameLabel.snp.bottom)
        }

        buttonCom.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(buttonRu.snp.bottom)
        }
    }
}
