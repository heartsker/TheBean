//
//  MainStore.swift
//  TheBean
//
//  Created by Ilya Buldin on 14.04.2022.
//

import Foundation

final class MainStore {
    weak var coordinator: MainCoordinator?

    static let shared = MainStore()

    private init() { }
}
