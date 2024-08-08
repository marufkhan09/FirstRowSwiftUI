//
//  Interceptor.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//
import Alamofire
import Foundation

class LoggingInterceptor: RequestInterceptor {
    private let maxCharactersPerLine = 200

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        // Add any headers or modifications here
        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, with error: Error, completion: @escaping (RetryResult) -> Void) {
        // Implement retry logic if needed
        completion(.doNotRetry)
    }

    func log(_ request: Request) {
        debugPrint("--> \(request.request?.httpMethod ?? "") \(request.request?.url?.absoluteString ?? "")")
        debugPrint("Content type: \(request.request?.value(forHTTPHeaderField: "Content-Type") ?? "")")
        debugPrint("Headers: \(request.request?.allHTTPHeaderFields ?? [:])")
        debugPrint("Data: \(String(data: request.request?.httpBody ?? Data(), encoding: .utf8) ?? "")")
    }

    func log(_ response: DataResponse<Data?, AFError>) {
        debugPrint("<-- STATUS: \(response.response?.statusCode ?? 0)")
        if let data = response.data {
            let responseString = String(data: data, encoding: .utf8) ?? ""
            let maxCharactersPerLine = 200
            let numberOfLines = (responseString.count + maxCharactersPerLine - 1) / maxCharactersPerLine // Equivalent to ceil(responseString.count / maxCharactersPerLine)

            for i in 0..<numberOfLines {
                let start = i * maxCharactersPerLine
                let end = min(start + maxCharactersPerLine, responseString.count)
                let substring = responseString[start..<end]
                debugPrint(substring)
            }
        }
        debugPrint("<-- END HTTP")
    }
}
