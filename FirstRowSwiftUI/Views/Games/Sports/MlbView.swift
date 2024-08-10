//
//  MlbView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 11/8/24.
//

import SwiftUI

struct MlbView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            HorizontalCalendar()
            // Remove Spacer() if you don't need it
            // Spacer()
            // Or you can add other views here, depending on your design
        }
    }
}

#Preview {
    MlbView()
}

