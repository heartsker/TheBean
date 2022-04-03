//
//  TestVC.swift
//  TheBean
//
//  Created by Daniel Pustotin on 13.03.2022.
//

import UIKit
import SnapKit

class TestVC: UIViewController, IBaseView {
    // swiftlint:disable force_cast
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameLabel.text = Account.shared.username
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Properties
    lazy private var usernameLabel: UILabel = {
        UILabel(text: Account.shared.username ?? "noname", color: .blue, font: .bold(40))
    }()

    // MARK: - Setup
    func setupSubviews() {
        view.addSubview(usernameLabel)
    }

    func setupConstraints() {
        usernameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
}
