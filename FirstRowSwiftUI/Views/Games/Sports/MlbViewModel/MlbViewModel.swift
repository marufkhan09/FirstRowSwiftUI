//
//  MlbViewModel.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import Foundation


class MlbViewModel: ObservableObject {
    @Published var mlbEventLoading: Bool = false
    @Published var mlbGameData: [MlbData] = []
    @Published var errorMessage: String?
    
    private func showSnackbar(message: String) {
        // Implement this function based on your app's Snackbar or Alert system
        print("Snackbar Message: \(message)")
    }
    
//    func fetchMlbData() {
//        mlbEventLoading = true
//        errorMessage = nil
//        
//        BaseApiController.shared.request(
//            endpoint: "3/2024-08-09/2024-08-09",
//            method: .get
//        ) { result in
//            DispatchQueue.main.async {
//                self.mlbEventLoading = false
//                switch result {
//                case .success(let data):
//                    // Print the raw JSON response body
//                    if String(data: data, encoding: .utf8) != nil {
//                        // Pretty print the JSON
//                        self.prettyPrintJSON(data: data)
//                    }
//                    
//                    do {
//                        let mlbModel = try JSONDecoder().decode(MlbModel.self, from: data)
//                        self.mlbGameData = mlbModel.data!
//                    } catch {
//                        self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
//                        print("Failed to decode data: \(error.localizedDescription)")
//                    }
//                case .failure(let error):
//                    self.errorMessage = "Network request failed: \(error.localizedDescription)"
//                    print("Network request failed: \(error.localizedDescription)")
//                    self.showSnackbar(message: "Network request failed: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
    
    private func prettyPrintJSON(data: Data) {
        do {
            // Decode the JSON data into a Swift object
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            // Convert the Swift object back into JSON data with pretty printing
            let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            // Convert the pretty JSON data to a String
            if let prettyJSON = String(data: prettyData, encoding: .utf8) {
                print("Pretty JSON Response: \(prettyJSON)")
            }
        } catch {
            print("Error pretty printing JSON: \(error.localizedDescription)")
        }
    }
    
    
    func fetchMlbData() {
        mlbEventLoading = true
        errorMessage = nil

        // Load data from the local JSON file
        if let url = Bundle.main.url(forResource: "mlbdatafile", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                
                // Print the raw JSON response body
                if String(data: data, encoding: .utf8) != nil {
                    // Pretty print the JSON
                    self.prettyPrintJSON(data: data)
                }

                // Decode the data
                do {
                    let mlbModel = try JSONDecoder().decode(MlbModel.self, from: data)
                    self.mlbGameData = mlbModel.data!
                    print("DATA::::\(self.mlbGameData.count)")
                    self.mlbEventLoading = false
                } catch {
                    self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                    print("Failed to decode data: \(error.localizedDescription)")
                }
                
            } catch {
                self.errorMessage = "Failed to load data from file: \(error.localizedDescription)"
                print("Failed to load data from file: \(error.localizedDescription)")
            }
        } else {
            self.errorMessage = "JSON file not found."
            print("JSON file not found.")
        }
    }

    
}
