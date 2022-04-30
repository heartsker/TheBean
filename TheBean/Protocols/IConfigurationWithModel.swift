//
//  CellConfigurationProtocol.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

/// Provides functionality for configuration reusable cells etc.
protocol IConfigurationWithModel {
    associatedtype Model
    func configure(model: Model)
}
