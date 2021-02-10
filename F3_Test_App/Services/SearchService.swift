//
//  SearchService.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import Foundation

let url: String = "https://www.googleapis.com/books/v1/volumes"

class SearchService: NSObject {
    typealias QueryResult = (Response?, String) -> Void
    
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    var response: Response?
    
    func getResults(searchText: String, completion: @escaping QueryResult) {
        if var urlComponents = URLComponents(string: url) {
            urlComponents.query = "q=\(searchText)"
            
            guard let url = urlComponents.url else {
                print("Unable to set URL")
                return
            }
            
            self.dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
                
                if let error = error {
                    self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data, let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self?.parseResults(data)
                    
                    DispatchQueue.main.async {
                        completion(self?.response, self?.errorMessage ?? "")
                    }
                } else {
                    self?.errorMessage += "Loading data failed"
                }
            }
            
            self.dataTask?.resume()
        }
    }
    
    private func parseResults(_ data: Data) {
        self.response = nil
        
        do {
            let decoder = JSONDecoder()
            self.response = try decoder.decode(Response.self, from: data)
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
    }
}
