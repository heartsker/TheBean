//
//  Account+CoreDataProperties.swift
//  TheBean
//
//  Created by Daniel Pustotin on 03.04.2022.
//
//

import Foundation
import CoreData

extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged var rowEmail: String?
    @NSManaged var rowPassword: String?
    @NSManaged var rowUsername: String?

}

extension Account: Identifiable {

}
