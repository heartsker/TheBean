//
//  Account+CoreDataProperties.swift
//  Account
//
//  Created by Daniel Pustotin on 24.04.2022.
//

// swiftlint:disable missing_docs

import CoreData

extension Account {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var cupsCount: Int64
    @NSManaged public var healthScore: Int64
    @NSManaged public var level: Double
    @NSManaged public var rawEmail: String?
    @NSManaged public var rawImage: Data?
    @NSManaged public var rawUsername: String?
    @NSManaged public var recipesCount: Int64
}

extension Account: Identifiable {

}
