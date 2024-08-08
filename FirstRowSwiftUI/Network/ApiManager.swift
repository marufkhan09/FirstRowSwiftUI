//
//  ApiManager.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//

import Foundation
import Alamofire
import Combine

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchSpecialData() -> AnyPublisher<[Datum], Error> {
        let urlString = "https://halftimepick.laravel-script.com/api/posts" // Replace with your actual endpoint
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: SpecialModel.self, decoder: JSONDecoder())
            .value()
            .map { $0.data ?? [] } // Return an empty array if data is nil
            .mapError { $0 as Error } // Convert AFError to a generic Error
            .eraseToAnyPublisher()
    }
}

