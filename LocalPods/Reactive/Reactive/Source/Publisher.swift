//
//  Publisher.swift
//  Reactive
//
//  Created by Daniel Pustotin on 23.04.2022.
//

import Combine

/// Publisher provides functionality for publishing posts and subscribing onto them
public class Publisher {

    private struct Post<T> {
        let content: T
    }

    private static func stringPostPublisher<T>(for name: Notification.Name) ->
    Publishers.Map<NotificationCenter.Publisher, T?> {
        let publisher = NotificationCenter.Publisher(center: .default, name: name).map { (notification) -> T? in
            (notification.object as? Post<T>)?.content
        }
        return publisher
    }

    /// Publishes notification post
    /// - Parameters:
    ///   - content: Post content
    ///   - name: Notification identifier
    public static func publishPost<T>(with content: T, for name: Notification.Name) {
        let post = Post(content: content)
        NotificationCenter.default.post(name: name, object: post)
    }

    /// Subscribes object's property for updates
    /// - Parameters:
    ///   - object: Object to subscribe
    ///   - keyPath: Keypath of the property to subscribe
    ///   - name: Notification identifier
    public static func subscribe<T, U>(_ object: T,
                                       keyPath: ReferenceWritableKeyPath<T, U?>,
                                       for name: Notification.Name) {
        let subscriber = Subscribers.Assign(object: object, keyPath: keyPath)
        stringPostPublisher(for: name).subscribe(subscriber)
    }
}
