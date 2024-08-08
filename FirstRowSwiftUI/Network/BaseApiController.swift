import Alamofire
import Foundation

class BaseApiController {
    static let shared = BaseApiController()
    
    private let baseURL = "https://halftimepick.laravel-script.com/api/" // Replace with your actual base URL
    
    private init() {}
    
    private let sessionManager: Session = {
        let interceptor = Interceptor(
            adapter: LoggingInterceptor(),  // Ensure this is used
            retrier: ConnectivityRequestRetrier()
        )
        return Session(interceptor: interceptor)
    }()

    func request(
        endpoint: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let url = baseURL + endpoint
        sessionManager.request(url, method: method, parameters: parameters, headers: headers)
            .validate() // Validate status codes and content types
            .responseData { response in
                // Print logs for debugging
                print("Request: \(url), Method: \(method.rawValue)")
                debugPrint(response) // This will give you insight into the network request
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    self.handleError(response: response, error: error)
                    completion(.failure(error))
                }
            }
    }
    
    private func handleError(response: AFDataResponse<Data>, error: Error) {
        guard let statusCode = response.response?.statusCode else { return }
        
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
        
        // Optionally show a snackbar for errors
        showSnackbar(message: error.localizedDescription)
    }
    
    private func showSnackbar(message: String) {
        // Implement this function based on your app's Snackbar or Alert system
        print("Snackbar Message: \(message)")
    }
}
