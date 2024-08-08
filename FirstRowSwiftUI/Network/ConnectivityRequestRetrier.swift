//
//  ConnectivityRequestRetrier.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//

import Foundation
import Alamofire

class ConnectivityRequestRetrier: RequestRetrier {
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // Implement connectivity check and retry logic if needed
        if let afError = error.asAFError, afError.isSessionTaskError {
            completion(.retry)
        } else {
            completion(.doNotRetry)
        }
    }
}
