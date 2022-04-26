//
//  FileManager.swift
//  Utils
//
//  Created by Daniel Pustotin on 25.04.2022.
//

/// Typealias for JSON format - dictionary of type `[String: Any]`
public typealias Json = [String: Any]

/// `FileManager` provides functionality to work with files in app
public class FileManager {
    public static func json(from file: String, in bundle: Bundle, localize: Bool = false) -> Json? {
        let filename = file + (localize ? "-" + Locale.currentLocale : "")
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

/// Extends `FileManager` with getting module name of object method
public extension FileManager {
    static func module(of object: AnyObject) -> String {
        String(String(reflecting: object.self).prefix { $0 != "." })
    }
}
