//
//  APIModel.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import Foundation
import Alamofire

class APIModel {
    func getRecipesList() {
//    https://sampleapis.com/api-list/coffee
        let url = "https://sampleapis.com/api-list/coffee"
        
        AF.request(url)
            .validate(statusCode: 200 ..< 300)
            .responseDecodable { (response: DataResponse<Recipe, AFError>) in
//                    guard response.result.isSuccess else {
//                      print("🥶 Error on login: \(String(describing: response.error))")
//                      return
//                    }
//                    completion(response.result)
                }
    }
}
