import Alamofire
import Combine

class SpecialViewModel: ObservableObject {
    @Published var specialData: [Datum] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    func fetchData() {
        let url = "https://halftimepick.laravel-script.com/api/posts" // Replace with your actual API endpoint
        
        isLoading = true
        errorMessage = nil

        AF.request(url)
            .validate()
            .publishDecodable(type: SpecialModel.self)
            .handleEvents(receiveOutput: { response in
                print("Received response: \(response)")
            })
            .compactMap { response in
                return response.value
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                    print("Request finished successfully.")
                case .failure(let error):
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription
                    print("Request failed with error: \(error.localizedDescription)")
                }
            }, receiveValue: { specialModel in
                self.specialData = specialModel.data
                print("Parsed data: \(specialModel.data)")
            })
            .store(in: &cancellables)
    }
}
