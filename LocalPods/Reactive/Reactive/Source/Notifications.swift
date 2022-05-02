//
//  Notifications.swift
//  Reactive
//
//  Created by Daniel Pustotin on 04.04.2022.
//

// swiftlint:disable missing_docs

/// Extends `Notification.Name` for post names
public extension Notification.Name {

    static let usernamePost = Notification.Name("usernamePost")
    static let emailPost = Notification.Name("emailPost")
    static let profileImagePost = Notification.Name("profileImagePost")
}
