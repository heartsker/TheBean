//
//  ResourcesBundle.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

public extension Bundle {
    /// Resources bundle
    /// - Parameter object: Object which is searching resources for
    /// - Returns: Resources bundle
    static func resources(for object: AnyClass) -> Bundle {
        let bundle = Bundle(for: object)
        let module = FileManager.module(of: object)
        let url = bundle.url(forResource: module + "Resources", withExtension: "bundle") ??
                  Bundle.main.resourceURL ?? URL(fileURLWithPath: "")
        let resourcesBundle = Bundle(url: url) ?? Bundle.main
        return resourcesBundle
    }

}
