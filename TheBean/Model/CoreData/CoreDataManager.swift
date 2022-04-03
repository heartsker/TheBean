//
//  CoreDataManager.swift
//  TheBean
//
//  Created by Daniel Pustotin on 02.04.2022.
//

import UIKit
import CoreData

enum CoreDataError: LocalizedError {
    case fetchingError(String)

    var errorDescription: String? {
        switch self {
        case let .fetchingError(type):
            return "Failed to fetch entity of type \(type)"
        }
    }
}

class CoreDataManager {

    static let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
    static let managedContext: NSManagedObjectContext = CoreDataManager.appDelegate.persistentContainer.viewContext

    static func save() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save Account. \(error), \(error.userInfo)")
        }
    }

    static func fetchAccount() throws -> Account {
        var account: Account
        do {
            account = try managedContext.fetch(Account.fetchRequest()).first!
        } catch {
            throw CoreDataError.fetchingError("Account")
        }
        return account
    }
}
