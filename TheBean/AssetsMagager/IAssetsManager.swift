//
//  IAssetsManager.swift
//  TheBean
//
//  Created by Daniel Pustotin on 10.04.2022.
//

import UIKit

protocol IAssetsManager {
    associatedtype Asset

    static func asset(for string: String) -> Asset?
}

extension IAssetsManager where Asset == UIImage {
    static func asset(for string: String) -> Asset? {
        UIImage(named: string)
    }
}
