//
//  ResultsViewModel.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 08/02/21.
//

import Foundation

class ResultsViewModel {
    var title: String
    var authors: String?
    var image: String?
    
    let result: Result
    
    init(result: Result) {
        self.result = result
        
        self.title = result.volumeInfo?.title ?? ""
        
        if let authors = result.volumeInfo?.authors, authors.count > 0 {
            self.authors = authors.reduce("", { $0 + $1 })
        } else {
            self.authors = "Unknown author"
        }
        if let smallThumbnail = result.volumeInfo?.imageLinks?.smallThumbnail {
            self.image = smallThumbnail
        }
    }
}
