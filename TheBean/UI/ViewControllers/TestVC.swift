//
//  TestViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import SnapKit
import Localize
import Reactive
import Utils
import AssetsManager
import Account

/// View Controller for testing
class TestViewController: UIViewController {
    // MARK: - Properties

    lazy private var usernameLabel: UILabel = {
        let label = UILabel(text: Account.shared.email, color: Pallete.materialLight, font: FontManager.bold(30))
        label.textAlignment = .center
        Publisher.subscribe(label, keyPath: \.text, for: .emailPost)
        return label
    }()

    lazy private var buttonCom: UIButton = {
        let button = UIButton()
        button.setTitle("Make .com", for: .normal)
        button.addTarget(self, action: #selector(makeCom), for: .touchUpInside)
        button.setTitleColor(Pallete.materialLight, for: .normal)
        button.backgroundColor = Pallete.materialHeavy
        button.layer.cornerRadius = 15
        return button
    }()
    @objc func makeCom() {
        Account.shared.email = "the.bean@example.com"
        Publisher.publishPost(with: "the.bean@example.com", for: .emailPost)
        CoreDataManager.save()
    }
    lazy private var buttonRu: UIButton = {
        let button = UIButton()
        button.setTitle("Make .ru", for: .normal)
        button.addTarget(self, action: #selector(makeRu), for: .touchUpInside)
        button.setTitleColor(Pallete.materialLight, for: .normal)
        button.backgroundColor = Pallete.materialHeavy
        button.layer.cornerRadius = 15
        return button
    }()
    @objc func makeRu() {
        Account.shared.email = "the.bean@example.ru"
        Publisher.publishPost(with: "the.bean@example.ru", for: .emailPost)
        CoreDataManager.save()
    }

    lazy private var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Account.shared.email
        textField.keyboardType = .emailAddress

        Publisher.subscribe(textField, keyPath: \.placeholder, for: .emailPost)
        return textField
    }()

    lazy private var buttonSave: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveTextField), for: .touchUpInside)
        button.setTitleColor(Pallete.materialLight, for: .normal)
        button.backgroundColor = Pallete.materialHeavy
        button.layer.cornerRadius = 15
        return button
    }()

    @objc func saveTextField() {
        guard !(textField.text ?? "").isEmpty else {
            return
        }
        Account.shared.email = textField.text ?? ""
        Publisher.publishPost(with: textField.text ?? "", for: .emailPost)
        CoreDataManager.save()
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
extension TestViewController {
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
        view.addSubview(textField)
        view.addSubview(buttonSave)
    }

    private func setupConstraints() {
        usernameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }

        buttonRu.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(50)
            make.top.equalTo(usernameLabel.snp.bottom)
        }

        buttonCom.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(50)
            make.top.equalTo(buttonRu.snp.bottom).offset(50)
        }

        textField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(15)
            make.top.equalTo(buttonCom.snp.bottom).offset(50)
        }

        buttonSave.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(50)
            make.top.equalTo(textField.snp.bottom).offset(50)
        }
    }
}
