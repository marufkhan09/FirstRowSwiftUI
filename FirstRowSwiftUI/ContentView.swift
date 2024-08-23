//
//  ContentView.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 7/8/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CustomTabView()
    }
}

#Preview {
    ContentView().environmentObject(AppSettings())
}
