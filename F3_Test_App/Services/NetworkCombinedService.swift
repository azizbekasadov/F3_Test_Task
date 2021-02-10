//
//  NetworkCombinedService.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 09/02/21.
//

import Combine
import Foundation

class NetworkCombinedService {
    
    static let shared: NetworkCombinedService = {
        let shared = NetworkCombinedService()
        return shared
    }()
    
    private var cancellable: AnyCancellable?
    
    enum HTTPError: LocalizedError {
        case statusCode
    }

    private init() {}
    
    func fetchData(searchText: String, _ completion: @escaping(Response?)->Void) {
        guard var components = URLComponents(string: url) else {
            fatalError("Unable to proceed with request")
        }
        
        components.query = "q=\(searchText)"
        
        guard let urlValue = URL(string: url) else {
            fatalError("Unable to proceed with request")
        }
        
        self.cancellable = URLSession.shared.dataTaskPublisher(for: urlValue)
        .tryMap { output in
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                throw HTTPError.statusCode
            }
            return output.data
        }
        .decode(type: Response.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                Log.output("\n\(error.localizedDescription)")
            }
        }, receiveValue: { response in
            completion(response)
        })
    }
}
