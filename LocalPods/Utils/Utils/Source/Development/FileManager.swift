//
//  FileManager.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

import Foundation

public typealias Json = [String: Any]

public class FileManager {
    public static func json(from file: String, in bundle: Bundle, localize: Bool = false) -> Json? {
        let filename = file + (localize ? "-" + currentLocale() : "")
        do {
            guard let path = bundle.path(forResource: filename, ofType: "json"),
                  let jsonData = try String(contentsOfFile: path).data(using: .utf8),
                  let json = try JSONSerialization.jsonObject(with: jsonData) as? Json else {
                return nil
            }
            return json
        } catch {
            print(error.localizedDescription)
            return nil
        }

    }
}