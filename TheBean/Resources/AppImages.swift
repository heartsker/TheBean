//
//  AppImages.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import UIKit

extension UIImage {
    convenience init(appName: Localizer) {
        self.init(named: appName.rawValue)!
    }
}
