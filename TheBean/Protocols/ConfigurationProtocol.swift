//
//  CellConfigurationProtocol.swift
//  TheBean
//
//  Created by Ilya Buldin on 11.04.2022.
//

protocol ConfigurationProtocol {
    associatedtype Model
    func configure(model: Model)
}
