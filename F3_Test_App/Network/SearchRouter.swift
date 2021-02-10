//
//  SearchRouter.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 09/02/21.
//

import Alamofire
import Foundation

enum SearchRouter: Router {
    case volumes(q: String)
    
    var path: String {
        switch self {
        case .volumes:
            return "/volumes"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .volumes:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .volumes(let q):
            return ["q":q]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .volumes:
            return URLEncoding.queryString
        }
    }
}
