//
//  FileManagerError.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

enum FileManagerError: LocalizedError {
    case jsonExtracting(file: String)

    var errorDescription: String? {
        switch self {
        case let .jsonExtracting(file):
            return "Failed to  exctract json data from file \(file)"
        }
    }
}
