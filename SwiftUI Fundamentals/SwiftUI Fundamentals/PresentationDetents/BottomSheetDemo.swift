//
//  BottomSheetDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 05/08/24.
//

import SwiftUI

struct BottomSheetDemo: View {
    var body: some View {
        let restaurantsCollection = FormDemo().restaurants
        NavigationStack {
            List {
                ForEach(restaurantsCollection) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Restaurants")
        }
    }
}

#Preview {
    BottomSheetDemo()
}
