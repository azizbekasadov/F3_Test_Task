//
//  Router.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 09/02/21.
//

import Foundation
import Alamofire
//#if APPSTORE
let BaseURLString: String = "https://www.googleapis.com/books"

fileprivate let Api = "/v1"

protocol Router : URLRequestConvertible, CustomStringConvertible {
    var path:String { get }
    var method:HTTPMethod { get }
    var parameters:Parameters { get }
    var timeout:Double { get }
    var encoding:ParameterEncoding { get }
    var cacheable:Bool { get }
}

extension Router {
    public var urlString:URL {
        var url = try! BaseURLString.asURL()
        url = url.appendingPathComponent(Api)
        url = url.appendingPathComponent(self.path)
        return url
    }
    
    public func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: self.urlString)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = self.headers
        urlRequest.timeoutInterval = self.timeout
        urlRequest = try self.encoding.encode(urlRequest, with: self.parameters)
        return urlRequest
    }
 
    public var headers:[String:String] {
        return [:]
    }
    
    var description: String {
        var string = ""
        string += "url: \(self.urlString)\n"
        string += "method: \(self.method)\n"
        string += "headers: \(self.headers)\n"
        string += "parameters: \(self.parameters)\n"
        string += "timeout: \(self.timeout)"
        return string
    }
    
    var timeout: Double {
        return 60
    }
    
    var cacheable: Bool {
        return true
    }
}
