//
//  TestVC.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import UIKit
import SnapKit
import Localize
import class Reactive.Publisher
import Utils
import AssetsManager

class TestVC: UIViewController {
    // MARK: - Properties
    lazy private var usernameLabel: UILabel = {
        let label = UILabel(text: Account.shared.username, color: Pallete.materialLight, font: FontManager.bold(40))
        label.textAlignment = .center
        Publisher.subscribe(label, keyPath: \.text, for: .usernamePost)
        return label
    }()
    lazy private var buttonCom: UIButton = {
        let button = UIButton()
        button.setTitle("Make .com", for: .normal)
        button.addTarget(self, action: #selector(makeCom), for: .touchUpInside)
        button.setTitleColor(Pallete.materialLight, for: .normal)
        return button
    }()
    @objc func makeCom() {
        Account.shared.username = "the.bean@example.com"
    }
    lazy private var buttonRu: UIButton = {
        let button = UIButton()
        button.setTitle("Make .ru", for: .normal)
        button.addTarget(self, action: #selector(makeRu), for: .touchUpInside)
        button.setTitleColor(Pallete.materialLight, for: .normal)
        return button
    }()

    @objc func makeRu() {
        Account.shared.username = "the.bean@example.ru"
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBar(^ControllerLocalization.test, image: "wrench.and.screwdriver")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar(^ControllerLocalization.test, image: "wrench.and.screwdriver")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - Setup methods
extension TestVC {
    private func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    private func setupAppearance() {
        view.backgroundColor = Pallete.background
    }

    private func setupSubviews() {
        view.addSubview(usernameLabel)
        view.addSubview(buttonRu)
        view.addSubview(buttonCom)
    }

    private func setupConstraints() {
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
