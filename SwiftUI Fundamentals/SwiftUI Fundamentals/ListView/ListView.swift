//
//  ListView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 14/03/24.
//

import SwiftUI

struct ListView: View {
    var restaurants = [ Restaurant2(name: "Cafe Deadend", image: "cafedeadend"), Restaurant2(name: "Homei", image: "homei"),
                        
                        Restaurant2(name: "Teakha", image: "teakha"),
                        Restaurant2(name: "Cafe Loisl", image: "cafeloisl"), Restaurant2(name: "Petite Oyster", image: "petiteoyster"), Restaurant2(name: "For Kee Restaurant", image: "forkeerestaurant"), Restaurant2(name: "Po's Atelier", image: "posatelier"), Restaurant2(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                        Restaurant2(name: "Haigh's Chocolate", image: "haighschocolate"), Restaurant2(name: "Palomino Espresso", image: "palominoespresso"), Restaurant2(name: "Home", image: "upstate"),
                        Restaurant2(name: "Traif", image: "traif"),
                        Restaurant2(name: "Graham Avenue Meats And Deli", image: "grahamaven"),
                        Restaurant2(name: "Waffle & Wolf", image: "wafflewolf"), Restaurant2(name: "Five Leaves", image: "fiveleaves"), Restaurant2(name: "Cafe Lore", image: "cafelore"), Restaurant2(name: "Confessional", image: "confessional"), Restaurant2(name: "Barrafina", image: "barrafina"), Restaurant2(name: "Donostia", image: "donostia"), Restaurant2(name: "Royal Oak", image: "royaloak"), Restaurant2(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
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
struct Restaurant2: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct BasicImageView: View {
    var restaurant: Restaurant2
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
    var restaurant: Restaurant2
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
