//
//  StatisticsViewController.swift
//  TheBean
//
//  Created by Alina on 10.02.2022.
//

import UIKit
import SnapKit

// MARK: StatisticsViewController
class StatisticsViewController: UIViewController {
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
        StatisticsContentView()
    }()
}

// MARK: Setup methods
extension StatisticsViewController {
    private func setup() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(statisticsContentView)
    }

    private func setupConstraints() {
        let insetLeftRight: CGFloat = UIScreen.main.bounds.width * 0.08

        statisticsContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(insetLeftRight)
            make.width.equalToSuperview().inset(insetLeftRight)
        }

        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }

        scrollView.resizeContent()
    }
}
