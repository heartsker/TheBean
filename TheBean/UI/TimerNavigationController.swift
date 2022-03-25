//
//  TimerNavigationController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

class TimerNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem.title = "Timer"
        tabBarItem.image = UIImage(systemName: "timer")

        setViewControllers([TimerViewController()], animated: true)
    }
}
