import Alamofire

class BaseApiController {
    static let shared = BaseApiController()

    private init() {}

    private let sessionManager: Session = {
        let interceptor = Interceptor(
            adapter: LoggingInterceptor(),
            retrier: ConnectivityRequestRetrier()
        )
        
        return Session(interceptor: interceptor)
    }()

    func fetchSpecialData(completion: @escaping (Result<SpecialModel, Error>) -> Void) {
        let url = "https://yourapiendpoint.com/api/special" // Replace with your API URL
        
        sessionManager.request(url)
            .validate()
            .responseDecodable(of: SpecialModel.self) { response in
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
