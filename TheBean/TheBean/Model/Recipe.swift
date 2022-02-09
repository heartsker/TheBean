//
//  Recipe.swift
//  TheBean
//
//  Created by Daniel Pustotin on 01.02.2022.
//

import UIKit

struct Recipe: Codable {
    var title: String
    var description: String
//  var info: String (no api)
//  var image: UIImage (no api)
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
//      case image
    }
    
    init(_ title: String, _ description: String) {
        self.title = title
        self.description = description
//      self.image = image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
//        let imageData = try container.decode(Data.self, forKey: .image)
//        if let img = UIImage(data: imageData) {
//            image = img
//        } else {
//            image = UIImage()
//        }
    }
}
