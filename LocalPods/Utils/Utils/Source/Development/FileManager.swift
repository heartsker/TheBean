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
    /// Extracts raw json data from the file
    /// - Parameters:
    ///   - file: File to extract data from
    ///   - bundle: Bundle with the file
    ///   - localized: Defines whether the file is localized or not
    /// - Returns: File contents as `Json`
    public static func json(from file: String, in bundle: Bundle, localized: Bool = false) -> Json? {
        let filename = file + (localized ? "-" + Locale.currentLocale : "")
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
    // swiftlint:disable:next missing_docs
    static func module(of object: AnyObject) -> String {
        String(String(reflecting: object.self).prefix { $0 != "." })
    }
}
