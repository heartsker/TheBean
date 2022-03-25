//
//  StatisticsConstants.swift
//  TheBean
//
//  Created by Илья Чуб on 21.03.2022.
//

import Foundation

struct StatisticConstants {
    static let localizableFileName = "StatisticsLocalizable"

    enum Text {
        static let personalRecomendations = Bundle.main.localizedString(forKey: "personalRecommendations",
                                                                        value: "",
                                                                        table: localizableFileName)
        static let globalStatistics = Bundle.main.localizedString(forKey: "globalStatistics",
                                                                  value: "",
                                                                  table: localizableFileName)
    }
}
