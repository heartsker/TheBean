//
//  StatisticsViewController.swift
//  TheBean
//
//  Created by Alina on 10.02.2022.
//

import UIKit
import SnapKit

class StatisticsViewController: UIViewController, IBaseView {
    // MARK: - Properties
    let account: Account = Account()

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Subviews
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .background
        return scrollView
    }()

    private lazy var statisticsContentView = {
        StatisticsContentView(account: account)
    }()

    // MARK: - Setup
    func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(statisticsContentView)
    }

    func setupConstraints() {

        statisticsContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
            make.width.equalToSuperview().inset(20)
        }

        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }

        scrollView.resizeContent()
    }
}
