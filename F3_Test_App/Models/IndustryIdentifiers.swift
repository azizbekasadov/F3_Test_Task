//
//  IndustryIdentifiers.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation
import ObjectMapper

struct IndustryIdentifiers: Codable {
    var type: String?
    var identifier: String?
}

extension IndustryIdentifiers: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        identifier <- map["identifier"]
    }
}
