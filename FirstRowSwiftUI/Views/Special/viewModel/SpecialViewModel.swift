import Foundation

class SpecialViewModel: ObservableObject {
    @Published var specialData: [Datum] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchData() {
        isLoading = true
        errorMessage = nil
        
        BaseApiController.shared.request(
            endpoint: "posts",
            method: .get
        ) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data):
                    do {
                        let specialModel = try JSONDecoder().decode(SpecialModel.self, from: data)
                        self.specialData = specialModel.data
                    } catch {
                        self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                        print("Failed to decode data: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    self.errorMessage = "Network request failed: \(error.localizedDescription)"
                    print("Network request failed: \(error.localizedDescription)")
                    self.showSnackbar(message: "Network request failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func showSnackbar(message: String) {
        // Implement this function based on your app's Snackbar or Alert system
        print("Snackbar Message: \(message)")
    }
}
