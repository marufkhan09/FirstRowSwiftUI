//
//  NewsViewModel.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 19/8/24.
//
import Alamofire
import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var nbaNewsList: [News] = []
    @Published var isLoading: Bool = false
    

    func getNBANews() {
        isLoading = true
        let url = "https://allscores.p.rapidapi.com/api/allscores/news?sport=2"
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "1e463f0494mshc165327b512b9c9p1fc774jsn5883cfefa8a8",
            "X-RapidAPI-Host": "allscores.p.rapidapi.com"
        ]
        

        AF.request(url, headers: headers).responseDecodable(of: NbaNews.self) { response in
            switch response.result {
            case .success(let newsNba):
                self.nbaNewsList.removeAll()
                self.nbaNewsList = newsNba.news ?? []
                self.isLoading = false
                print("NBA News Count: \(self.nbaNewsList.count)")
            case .failure(let error):
                print("Failed to load data: \(error.localizedDescription)")
            }
        }
    }
}



