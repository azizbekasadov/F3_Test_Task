//
//  NetworkService.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 09/02/21.
//

import Alamofire
import Foundation
import ObjectMapper

typealias RequestCompletion<T:Mappable> = (_ statusCode:HttpStatus, _ data:T?, _ errorMessage:String?)->Void

fileprivate func request(router:Router,
             completion: @escaping (_ statusCode:HttpStatus?, _ responseJSON:Any?, _ error:String?) -> Void) {
    
    AF.request(router).responseJSON { (response) in
        if let httpResponse = response.response {
            Log.output("\n\(router)\n\(response.value ?? "nil")")
            let statusCode = HttpStatus(rawValue: httpResponse.statusCode)
            Log.output("\n\(String(describing: statusCode?.rawValue))")
            completion(statusCode, response.value, nil)
        } else if let error = response.error {
            completion(nil, nil, error.underlyingError?.localizedDescription)
        }
    }
}

func kapRequest<T:Mappable>(router:Router,
                            completion: @escaping RequestCompletion<T>) {
    request(router: router) { (status, json, error) in
        
        if status == nil {
            completion(HttpStatus.LocalError, nil, error)
        } else {
            if let jsonData = json as? [String : Any] {
                let response = Mapper<Response>().map(JSON: jsonData)
                completion(status!, response as? T, nil)
            }
        }
        
    }
}
