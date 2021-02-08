//
//  Result.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation

struct Result: Codable {
    let kind: String?
    let id: String?
    let etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    
    enum CodingKeys: String, CodingKey {
        case kind
        case id
        case etag
        case selfLink
        case volumeInfo = "volumeInfo"
    }
}
