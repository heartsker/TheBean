//
//  TimerViewController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import Localize
import Utils
import AssetsManager

class TimerViewController: UIViewController {
    // MARK: - Properties
    private lazy var label: UILabel = {
        UILabel(text: "That is timer", color: Pallete.materialHeavy, font: FontManager.bold(30))
    }()

    // MARK: - Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBar(^ControllerLocalization.timer, image: "timer")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar(^ControllerLocalization.timer, image: "timer")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup methods
extension TimerViewController {
    private func setup() {
        setupAppearance()
        setupSubviews()
        setupConstraints()
    }

    private func setupAppearance() {
        view.backgroundColor = Pallete.background
    }

    private func setupSubviews() {
        view.addSubview(label)
    }

    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
