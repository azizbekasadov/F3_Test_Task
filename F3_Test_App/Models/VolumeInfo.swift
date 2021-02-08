//
//  VolumeInfo.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation

struct VolumeInfo: Codable {
    let title: String?
    let subtitle: String?
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let industryIdentifiers: [IndustryIdentifiers]?
    let pageCount: Int?
    let categories: [String]?
    let averageRating: Int?
    let ratingsCount: Int?
    let imageLinks: ImageLinks?
    let previewLink: String?
}

struct ImageLinks: Codable {
    var smallThumbnail: String?
    var thumbnail: String?
}
