//
//  ModuleName.swift
//  Utils
//
//  Created by Daniel Pustotin on 24.04.2022.
//

public func moduleName(of object: AnyObject) -> String {
    String(String(reflecting: object.self).prefix { $0 != "." })
}
