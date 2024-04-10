//
//  RestaurantDetailView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 10/04/24.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant
    var body: some View {
        VStack {
            Image(restaurant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            Text(restaurant.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
          Spacer()
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(name: "a", image: "caskpubkitchen"))
}
