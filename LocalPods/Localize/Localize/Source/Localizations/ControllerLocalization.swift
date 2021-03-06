//
//  ControllerLocalization.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

/// Localization for Controller
public class ControllerLocalization: ILocalizable {
    public static let table: String = "Controller"

    public static let recipes = ControllerLocalization.localize("recipes")
    public static let statistics = ControllerLocalization.localize("statistics")
    public static let timer = ControllerLocalization.localize("timer")
    public static let account = ControllerLocalization.localize("account")
    public static let test = ControllerLocalization.localize("test")
}
