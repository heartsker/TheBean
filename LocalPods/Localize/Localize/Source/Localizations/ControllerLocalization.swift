//
//  ControllerLocalization.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

/// Localization for Controller
public class ControllerLocalization: ILocalizable {
    public static let table: String = "Controller"

    public static let recipes = ControllerLocalization.localize(id: "recipes")
    public static let statistics = ControllerLocalization.localize(id: "statistics")
    public static let timer = ControllerLocalization.localize(id: "timer")
    public static let account = ControllerLocalization.localize(id: "account")
    public static let test = ControllerLocalization.localize(id: "test")
}
