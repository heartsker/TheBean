//
//  BeanNavigationController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import Foundation
import UIKit

class BeanNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "NC"
        tabBarItem.image = UIImage(systemName: "question")
    }
}
