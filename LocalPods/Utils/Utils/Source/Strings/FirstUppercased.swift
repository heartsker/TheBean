//
//  FirstUppercased.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.03.2022.
//

fileprivate extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}

prefix operator ^
public prefix func ^ (string: String) -> String {
    string.firstUppercased
}
