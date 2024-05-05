//
//  ResponseModelClass.swift
//  TestApp
//
//  Created by jay kumar on 05/05/24.
//

import Foundation
struct ResponseModelClass : Codable{
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
