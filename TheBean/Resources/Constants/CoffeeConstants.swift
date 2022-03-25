//
//  CoffeeConstants.swift
//  TheBean
//
//  Created by Илья Чуб on 21.03.2022.
//

import Foundation

struct CoffeeConstants {
    static let localizableFileName = "CoffeeLacalizable"

    enum Text {
        static let americano = Bundle.main.localizedString(forKey: "americano",
                                                           value: "",
                                                           table: localizableFileName)
        static let flatWhite = Bundle.main.localizedString(forKey: "flatWhite",
                                                           value: "",
                                                           table: localizableFileName)
        static let latte = Bundle.main.localizedString(forKey: "latte",
                                                       value: "",
                                                       table: localizableFileName)
    }
}
