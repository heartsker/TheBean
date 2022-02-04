//
//  Recipe.swift
//  TheBean
//
//  Created by Daniel Pustotin on 01.02.2022.
//

import Foundation
import UIKit

class Recipe: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case title
        case info
        case image
    }
    
    var title: String
    var info: String
    var image: UIImage
    
    init(_ title: String, _ info: String, img image: UIImage) {
        self.title = title
        self.info = info
        self.image = image
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        info = try container.decode(String.self, forKey: .info)
        let imageData = try container.decode(Data.self, forKey: .image)
        if let img = UIImage(data: imageData) {
            image = img
        } else {
            image = UIImage()
        }
    }
}
