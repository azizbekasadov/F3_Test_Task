//
//  Result.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation
import ObjectMapper

struct Result: Codable, Identifiable {
    var kind: String?
    var id: String?
    var etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    
    enum CodingKeys: String, CodingKey {
        case kind
        case id
        case etag
        case selfLink
        case volumeInfo = "volumeInfo"
    }
}

extension Result: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        kind <- map["kind"]
        id <- map["id"]
        etag <- map["etag"]
        selfLink <- map["selfLink"]
        volumeInfo <- map["volumeInfo"]
    }
}
