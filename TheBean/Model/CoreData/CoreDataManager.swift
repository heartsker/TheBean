//
//  CoreDataManager.swift
//  TheBean
//
//  Created by Daniel Pustotin on 02.04.2022.
//

import UIKit
import CoreData
import Account

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

    static func fetch() throws -> Account {
        do {
            guard let object = try? managedContext.fetch(Account.fetchRequest()).first else {
                throw CoreDataError.fetchingError(Account.self)
            }
            return object
        } catch {
            throw CoreDataError.fetchingError(Account.self)
        }
    }
}
