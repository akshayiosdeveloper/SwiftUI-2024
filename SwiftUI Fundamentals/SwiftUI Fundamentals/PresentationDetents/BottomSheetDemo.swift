//
//  BottomSheetDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 05/08/24.
//

import SwiftUI

struct BottomSheetDemo: View {
    @State private var selectedDetent: PresentationDetent = .medium
    @State private var selectedRestaurant: RestaurantDemo?
    var body: some View {
        let restaurantsCollection = FormDemo().restaurants
        NavigationStack {
            List {
                ForEach(restaurantsCollection) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                        .onTapGesture {
                                self.selectedRestaurant = restaurant
                            }
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Restaurants")
        }
        .sheet(item: $selectedRestaurant) { restaurant in
            RestaurantDetailViewDemo(restaurant: restaurant)
                .presentationDetents([.height(200), .medium, .large], selection: $selectedDetent)
//                .presentationDetents([.fraction(0.1), .height(200), .medium, .large])
               // .presentationDetents([.medium, .large])
                .presentationDragIndicator(.hidden)
        }
       
    }
}

#Preview {
    BottomSheetDemo()
}
