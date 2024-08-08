//
//  String.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//

import Foundation

extension String {
    subscript(range: Range<Int>) -> String {
        let start = index(self.startIndex, offsetBy: range.lowerBound)
        let end = index(self.startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
}
