//
//  Account+CoreDataClass.swift
//  TheBean
//
//  Created by Daniel Pustotin on 03.04.2022.
//
//

import CoreData
import UIKit
import Reactive

@objc(Account)
public class Account: NSManagedObject {
    // MARK: - Properties
    static var shared: Account {
        guard let account = try? CoreDataManager.fetch(Account.self) as? Account else {
            let account = Account()
            CoreDataManager.save()
            return account
        }
        return account
    }

    private let defaultUsername: String = "username"
    private let defaultEmail: String = "the.bean@example.com"

    var username: String {
        get {
            rawUsername ?? defaultUsername
        }
        set {
            rawUsername = newValue
            Reactive.Publisher.publishPost(with: username, for: .usernamePost)
            CoreDataManager.save()
        }
    }

    var email: String {
        get {
            rawEmail ?? defaultEmail
        }
        set {
            rawEmail = newValue
            CoreDataManager.save()
        }
    }

    var image: UIImage? {
        get {
            guard let data = rawImage else {
                return nil
            }
            return UIImage(data: data)
        }
        set {
            rawImage = newValue?.jpegData(compressionQuality: 1.0)
            CoreDataManager.save()
        }
    }

    // MARK: - Initialization
    convenience init() {
        self.init(context: CoreDataManager.managedContext)

        image = nil
        cupsCount = 0
        recipesCount = 0
        healthScore = 0
        level = 0
    }
}
