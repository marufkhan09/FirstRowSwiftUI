//
//  samples.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 9/8/24.
//

import Alamofire

class SampleRequests {
    static func fetchData() {
        NetworkManager.shared.request(
            "https://example.com/api/data",
            method: .get,
            completion: { (result: Result<SpecialModel, Error>) in
                switch result {
                case .success(let data):
                    print("Fetched data: \(data)")
                case .failure(let error):
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }
        )
    }
    
    static func postData() {
        let parameters: Parameters = [
            "key1": "value1",
            "key2": "value2"
        ]
        
        NetworkManager.shared.request(
            "https://example.com/api/data",
            method: .post,
            parameters: parameters,
            completion: { (result: Result<SpecialModel, Error>) in
                switch result {
                case .success(let data):
                    print("Posted data: \(data)")
                case .failure(let error):
                    print("Error posting data: \(error.localizedDescription)")
                }
            }
        )
    }
    
    static func putData() {
        let parameters: Parameters = [
            "key1": "updatedValue1",
            "key2": "updatedValue2"
        ]
        
        NetworkManager.shared.request(
            "https://example.com/api/data/1",
            method: .put,
            parameters: parameters,
            completion: { (result: Result<SpecialModel, Error>) in
                switch result {
                case .success(let data):
                    print("Updated data: \(data)")
                case .failure(let error):
                    print("Error updating data: \(error.localizedDescription)")
                }
            }
        )
    }
    
    static func deleteData() {
        NetworkManager.shared.request(
            "https://example.com/api/data/1",
            method: .delete,
            completion: { (result: Result<SpecialModel, Error>) in
                switch result {
                case .success(let data):
                    print("Deleted data: \(data)")
                case .failure(let error):
                    print("Error deleting data: \(error.localizedDescription)")
                }
            }
        )
    }
}

