//
//  NetworkManager.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 9/8/24.
//
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private let sessionManager: Session = {
        let interceptor = Interceptor(
            adapter: LoggingInterceptor(),
            retrier: ConnectivityRequestRetrier()
        )
        return Session(interceptor: interceptor)
    }()
    
    // Generic function for making network requests
    func request<T: Decodable>(
        _ endpoint: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        sessionManager.request(endpoint, method: method, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    self.handleStatusCode(response.response?.statusCode, error: error)
                    completion(.failure(error))
                }
            }
    }
    
    private func handleStatusCode(_ statusCode: Int?, error: Error) {
        guard let statusCode = statusCode else { return }
        
        switch statusCode {
        case 400:
            debugPrint("Bad Request: \(error.localizedDescription)")
        case 401:
            debugPrint("Unauthorized: \(error.localizedDescription)")
        case 403:
            debugPrint("Forbidden: \(error.localizedDescription)")
        case 404:
            debugPrint("Not Found: \(error.localizedDescription)")
        case 500:
            debugPrint("Internal Server Error: \(error.localizedDescription)")
        default:
            debugPrint("Unhandled Status Code \(statusCode): \(error.localizedDescription)")
        }
    }
}

