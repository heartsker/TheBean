//
//  StatisticsViewController.swift
//  TheBean
//
//  Created by Alina on 10.02.2022.
//

import SnapKit
import Localize
import Utils
import AssetsManager

/// Statistics View Controller
class StatisticsViewController: UIViewController {
    // MARK: - Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBar(^ControllerLocalization.statistics, image: "chart.bar.xaxis")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Subviews
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = Pallete.background
        return scrollView
    }()

    private lazy var statisticsContentView = {
        StatisticsContentView()
    }()
}

// MARK: - Setup methods
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
        let insetLeftRight: CGFloat = .screenWidth * 0.08

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
