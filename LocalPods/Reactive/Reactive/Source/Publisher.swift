//
//  Publisher.swift
//  Reactive
//
//  Created by Daniel Pustotin on 23.04.2022.
//

import Combine

public class Publisher {

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

    public static func publishPost<T>(with content: T, for name: Notification.Name) {
        let post = Post(content: content)
        NotificationCenter.default.post(name: .usernamePost, object: post)
    }

    public static func subscribe<T>(_ object: T,
                                    keyPath: ReferenceWritableKeyPath<T, String?>,
                                    for name: Notification.Name) {
        let subscriber = Subscribers.Assign(object: object, keyPath: keyPath)
        stringPostPublisher(for: name).subscribe(subscriber)
    }
}
