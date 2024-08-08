//
//  ConnectivityRequestRetrier.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//

import Alamofire

class ConnectivityRequestRetrier: RequestRetrier {
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if let afError = error.asAFError, afError.isSessionTaskError {
            completion(.retry)
        } else {
            completion(.doNotRetry)
        }
    }
}

