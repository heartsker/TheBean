//
//  StatisticsViewController.swift
//  TheBean
//
//  Created by Alina on 10.02.2022.
//

import UIKit
import SnapKit

class StatisticsViewController: UIViewController, IBaseView {
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

    // MARK: - Setup
    func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(statisticsContentView)
    }

    func setupConstraints() {
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
