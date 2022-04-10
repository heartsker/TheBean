//
//  FirstUppercased.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}

prefix operator ^
prefix func ^ (string: String) -> String {
    string.firstUppercased
}
