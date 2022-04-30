//
//  Account.swift
//  Account
//
//  Created by Daniel Pustotin on 24.04.2022.
//

import CoreData

@objc(Account)
public class Account: NSManagedObject {
    // MARK: - Properties
    public private(set) static var shared: Account!

    public static func setup(with account: Account) {
        Self.shared = account
    }

    public static func setup(with context: NSManagedObjectContext) {
        Self.shared = Account(in: context)
    }

    private let defaultUsername: String = "username"
    private let defaultEmail: String = "the.bean@example.com"

    public var username: String {
        get {
            rawUsername ?? defaultUsername
        }
        set {
            rawUsername = newValue
        }
    }

    public var email: String {
        get {
            rawEmail ?? defaultEmail
        }
        set {
            rawEmail = newValue
        }
    }

    public var image: UIImage? {
        get {
            guard let data = rawImage else {
                return nil
            }
            return UIImage(data: data)
        }
        set {
            rawImage = newValue?.jpegData(compressionQuality: 1.0)
        }
    }

    convenience init(in context: NSManagedObjectContext) {
        self.init(context: context)

        cupsCount = 0
        healthScore = 0
        level = 0
        rawEmail = nil
        rawImage = nil
        rawUsername = nil
        recipesCount = 0
    }
}
