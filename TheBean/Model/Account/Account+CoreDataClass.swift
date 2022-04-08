//
//  Account+CoreDataClass.swift
//  TheBean
//
//  Created by Daniel Pustotin on 03.04.2022.
//
//

import Foundation
import CoreData

@objc(Account)
public class Account: NSManagedObject {
    // MARK: - Properties
    static var shared: Account {
        guard let account = try? CoreDataManager.fetchAccount() else {
            let account = Account()
            CoreDataManager.save()
            return account
        }
        return account
    }

    var username: String {
        get {
            return rowUsername ?? ""
        }
        set {
            rowUsername = newValue
            Publisher.publishPost(with: username, for: .usernamePost)
            CoreDataManager.save()
        }
    }

    var email: String {
        get {
            return rowEmail ?? ""
        }
        set {
            rowEmail = newValue
            CoreDataManager.save()
        }
    }

    // MARK: - Initialization
    convenience init() {
        self.init(context: CoreDataManager.managedContext)
    }
}
