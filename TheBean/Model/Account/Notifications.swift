//
//  Notifications.swift
//  TheBean
//
//  Created by Daniel Pustotin on 04.04.2022.
//

import Foundation
import Combine

extension Notification.Name {
    static let usernamePost = Notification.Name("usernamePost")
}

class Publisher {

    private struct Post<T> {
        let content: T
    }

    private static func stringPostPublisher<T>(for name: Notification.Name) ->
    Publishers.Map<NotificationCenter.Publisher, T?> {
        let publisher = NotificationCenter.Publisher(center: .default, name: name)
            .map { (notification) -> T? in
                return (notification.object as? Post<T>)?.content
            }
        return publisher
    }

    static func publishPost<T>(with content: T, for name: Notification.Name) {
        let post = Post(content: content)
        NotificationCenter.default.post(name: .usernamePost, object: post)
    }

    static func subscribe<T>(_ object: T, keyPath: ReferenceWritableKeyPath<T, String?>, for name: Notification.Name) {
        let subscriber = Subscribers.Assign(object: object, keyPath: keyPath)
        stringPostPublisher(for: name).subscribe(subscriber)
    }

}
