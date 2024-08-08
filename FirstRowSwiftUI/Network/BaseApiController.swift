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

}
