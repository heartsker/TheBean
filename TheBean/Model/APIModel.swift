//
//  APIModel.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit
import Alamofire

// MARK: - Draft
// class APIModel {
//
//    // Verification of successful receipt of data:
//    func getRecipesList() {
//        let url = URL(string: "https://api.sampleapis.com/coffee/hot")
//        AF.request(url!)
//            .validate(statusCode: 200 ..< 300)
//            .responseDecodable { (response: DataResponse<[Recipe], AFError>) in
//                let result = response.result
//                print(result)
//            }
//    }
//
//    // Not finalized for the project:
//    func getRecipesList(completion: @escaping (Result<[Recipe], AFError>) -> Void) {
//        let url = URL(string: "https://api.sampleapis.com/coffee/hot")
//        AF.request(url!)
//            .validate(statusCode: 200 ..< 300)
//            .responseDecodable { (response: DataResponse<[Recipe], AFError>) in
//            guard case .success = response.result else {
//                print("Error")
//                return
//            }
//            print(response.result)
//            completion(response.result)
//        }
//    }
//
// }
