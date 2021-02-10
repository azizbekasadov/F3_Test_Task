//
//  Response.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation
import ObjectMapper

struct Response: Codable {
    var kind: String?
    var totalItems: Int?
    var items: [Result]?
    
    init() {}
    
    init(kind: String, totalItems: Int, items: [Result]) {
        self.kind = kind
        self.totalItems = totalItems
        self.items = items
    }
}

extension Response: Mappable {
    mutating func mapping(map: Map) {
        kind <- map["kind"]
        totalItems <- map["totalItem"]
        items <- map["items"]
    }
    
    init?(map: Map) { }
}
