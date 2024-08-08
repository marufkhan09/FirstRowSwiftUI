import Alamofire
import Combine
import SwiftUI

class SpecialViewModel: ObservableObject {
    @Published var specialData: [Datum] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    func fetchData() {
        let url = "https://halftimepick.laravel-script.com/api/posts"
        isLoading = true
        errorMessage = nil

        NetworkManager.shared.request(
            url,
            method: .get,
            completion: { (result: Result<SpecialModel, Error>) in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                switch result {
                case .success(let specialModel):
                    self.specialData = specialModel.data
                    print("Parsed data: \(specialModel.data)")
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("Request failed with error: \(error.localizedDescription)")
                }
            }
        )
    }
}
