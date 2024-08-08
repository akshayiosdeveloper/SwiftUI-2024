//
//  TinderHome.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 08/08/24.
//

import SwiftUI

struct TinderHome: View {
    var body: some View {
        TopBarMenu()
        TinderCardView(image: trips[0].image, title: trips[0].destination)
    }
}

#Preview {
    TinderHome()
}
