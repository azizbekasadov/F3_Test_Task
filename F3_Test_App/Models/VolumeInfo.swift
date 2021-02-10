//
//  VolumeInfo.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation
import ObjectMapper

struct VolumeInfo: Codable {
    var title: String?
    var subtitle: String?
    var authors: [String]?
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var industryIdentifiers: [IndustryIdentifiers]?
    var pageCount: Int?
    var categories: [String]?
    var averageRating: Int?
    var ratingsCount: Int?
    var imageLinks: ImageLinks?
    var previewLink: String?
}

extension VolumeInfo: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        subtitle <- map["subtitle"]
        authors <- map["authors"]
        publisher <- map["publisher"]
        publishedDate <- map["publishedDate"]
        description <- map["description"]
        industryIdentifiers <- map["industryIdentifiers"]
        pageCount <- map["pageCount"]
        categories <- map["categories"]
        averageRating <- map["averageRating"]
        ratingsCount <- map["ratingsCount"]
        imageLinks <- map["imageLinks"]
        previewLink <- map["previewLink"]
    }
}

struct ImageLinks: Codable {
    var smallThumbnail: String?
    var thumbnail: String?
}

extension ImageLinks: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        smallThumbnail <- map["smallThumbnail"]
        thumbnail <- map["thumbnail"]
    }
}
