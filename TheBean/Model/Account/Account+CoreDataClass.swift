//
//  Account+CoreDataClass.swift
//  TheBean
//
//  Created by Daniel Pustotin on 03.04.2022.
//
//

import Foundation
import CoreData
import UIKit

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
            return rowUsername ?? "Wane Smith"
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

    var userimage: UIImage = UIImage(named: "account.profile.picture.test")!
    var cupsDrunk: Int = 54
    var recipesMastered: Int = 24
    var healthScore: Int = 38
    var level: Int = 39

    // MARK: - Initialization
    convenience init() {
        self.init(context: CoreDataManager.managedContext)
    }
}
