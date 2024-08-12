//
//  ListBack.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 8/8/24.
//

import SwiftUI

struct ListBack: View {
    var body: some View {
        ZStack(alignment: .bottom){
            Color(.blue).frame(width: 400,height: 100)
            Color(.black).frame(width: 400,height: 50).clipShape(UnevenRoundedRectangle(topLeadingRadius: 15,topTrailingRadius: 15))
            
        }
        
    }
}

#Preview {
    ListBack()
}
