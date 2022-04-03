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
    static var shared: Account {
        guard let account = try? CoreDataManager.fetchAccount() else {
            let account = Account()
            CoreDataManager.save()
            return account
        }
        return account
    }

    convenience init() {
        self.init(context: CoreDataManager.managedContext)
    }
}
