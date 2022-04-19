//
//  CoordinatorProtocol.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import Foundation

protocol CoordinatorProtocol {
    func start()
    func coordinate(to coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {
    func coordinate(to coordinator: CoordinatorProtocol) {
        coordinator.start()
    }
}
