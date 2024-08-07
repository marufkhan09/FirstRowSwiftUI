//
//  AppSetting.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//

import SwiftUI
import Combine

class AppSettings: ObservableObject {
    @Published var isDarkMode: Bool = false
}
