//
//  MlbView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI

struct MlbView: View {
    @State private var selectedDate: Date = Date() // Track the selected date
    @StateObject private var viewModel = MlbViewModel() // ViewModel to fetch data
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Format the date as YYYY-MM-DD
        return formatter.string(from: selectedDate)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HorizontalCalendar(selectedDate: $selectedDate) // Pass the selected date to the calendar
            
            // Pass the fetched data and loading state to MlbGamesList
            MlbGamesList(viewModel: viewModel)
            
                .onChange(of: selectedDate, { oldValue, newValue in
                    viewModel.fetchMlbDataFromJson()
                })
                .onAppear {
                    viewModel.fetchMlbDataFromJson()
                }
        }
        .background(Color(UIColor.systemBackground)) // Adapts to dark/light mode automatically
    }
    
    
    
}

#Preview {
    MlbView()
}


