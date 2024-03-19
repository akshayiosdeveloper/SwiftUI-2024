//
//  ListView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 14/03/24.
//

import SwiftUI

struct ListView: View {
    var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"), Restaurant(name: "Homei", image: "homei"),
                        
                        Restaurant(name: "Teakha", image: "teakha"),
                        Restaurant(name: "Cafe Loisl", image: "cafeloisl"), Restaurant(name: "Petite Oyster", image: "petiteoyster"), Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"), Restaurant(name: "Po's Atelier", image: "posatelier"), Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"), Restaurant(name: "Palomino Espresso", image: "palominoespresso"), Restaurant(name: "Home", image: "upstate"),
                        Restaurant(name: "Traif", image: "traif"),
                        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamaven"),
                        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"), Restaurant(name: "Five Leaves", image: "fiveleaves"), Restaurant(name: "Cafe Lore", image: "cafelore"), Restaurant(name: "Confessional", image: "confessional"), Restaurant(name: "Barrafina", image: "barrafina"), Restaurant(name: "Donostia", image: "donostia"), Restaurant(name: "Royal Oak", image: "royaloak"), Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    var body: some View {
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                if (0...1).contains(index) { FullImageRow(restaurant: self.restaurants[index])
                } else {
                    BasicImageView(restaurant: self.restaurants[index])
                }
            }
            .listRowSeparator(.hidden, edges: .bottom)
            
        }
        .background {
            Image("homei")
                .resizable()
                .scaledToFill()
                .clipped()
        }
        
        .listStyle(.plain)
    }
}
#Preview {
    ListView()
}
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct BasicImageView: View {
    var restaurant: Restaurant
    var body: some View {
       HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40,height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
} }
}
