//
//  ResourcesBundle.swift
//  DevelopmentUtils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

public func resourcesBundle(of object: AnyClass) -> Bundle {
    let bundle = Bundle(for: object)
    let module = moduleName(of: object)
    let url = bundle.url(forResource: module + "Resources", withExtension: "bundle") ?? Bundle.main.resourceURL!
    let resourcesBundle = Bundle(url: url) ?? Bundle.main
    return resourcesBundle
}
