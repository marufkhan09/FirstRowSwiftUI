import Foundation

class SpecialViewModel: ObservableObject {
    @Published var specialData: [Datum] = []
    @Published var mlbData: [MlbData] = []
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
    
    func fetchMlbData() {
        isLoading = true
        errorMessage = nil
        
        BaseApiController.shared.request(
            endpoint: "3/2024-08-09/2024-08-09",
            method: .get
        ) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let data):
                    // Print the raw JSON response body
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("Raw JSON Response: \(jsonString)")
                    }
                    do {
                        let mlbModel = try JSONDecoder().decode(MlbModel.self, from: data)
                        self.mlbData = mlbModel.data!
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
