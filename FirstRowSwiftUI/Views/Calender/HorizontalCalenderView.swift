//
//  HorizontalCalenderView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//


import SwiftUI

struct HorizontalCalendar: View {
    @State private var selectedDate: Date = Date()
    private let calendar = Calendar.current
    private let today = Date()
    
    @State private var scrollViewProxy: ScrollViewProxy?
    
    private var dates: [Date] {
        var dates = [Date]()
        
        let range = -1000...1000 // A large enough range to simulate infinite scrolling
        
        for offset in range {
            if let date = calendar.date(byAdding: .day, value: offset, to: today) {
                dates.append(date)
            }
        }
        return dates
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(dates, id: \.self) { date in
                        DateButton(date: date, isSelected: calendar.isDate(date, inSameDayAs: selectedDate)) {
                            selectedDate = date
                            withAnimation {
                                scrollToSelectedDate(proxy: proxy)
                            }
                        }
                    }
                }
                .onAppear {
                    scrollViewProxy = proxy
                    // Initial scroll to center the selected date
                    scrollToSelectedDate(proxy: proxy)
                }
            }
        }
    }
    
    private func scrollToSelectedDate(proxy: ScrollViewProxy) {
        let selectedIndex = dates.firstIndex(where: { calendar.isDate($0, inSameDayAs: selectedDate) }) ?? 0
        withAnimation {
            proxy.scrollTo(dates[selectedIndex], anchor: .center)
        }
    }
}


struct HorizontalCalendar_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCalendar()
    }
}
