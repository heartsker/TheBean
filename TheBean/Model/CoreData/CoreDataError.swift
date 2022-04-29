//
//  CoreDataError.swift
//  TheBean
//
//  Created by Daniel Pustotin on 23.04.2022.
//

import CoreData

/// Errors for CoreDataManager
enum CoreDataError: LocalizedError {
    case fetchingError(NSManagedObject.Type)

    var errorDescription: String? {
        switch self {
        case let .fetchingError(type):
            return "Failed to fetch entity of type \(type)"
        }
    }
}

class abc {

}
