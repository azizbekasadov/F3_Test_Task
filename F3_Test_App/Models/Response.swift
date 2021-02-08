//
//  Response.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation

struct Response: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [Result]?
}
