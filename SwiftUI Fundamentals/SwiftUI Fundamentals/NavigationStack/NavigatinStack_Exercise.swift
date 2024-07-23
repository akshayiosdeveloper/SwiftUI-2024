//
//  NavigatinStack_Exercise.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 10/04/24.
//

import SwiftUI

struct NavigatinStack_Exercise: View {
    
    var restaurants = [ Restaurant2(name: "Cafe Deadend", image: "cafedeadend"),
                   Restaurant2(name: "Homei", image: "homei"),
                   Restaurant2(name: "Teakha", image: "teakha"),
                   Restaurant2(name: "Cafe Loisl", image: "cafeloisl"),
                   Restaurant2(name: "Petite Oyster", image: "petiteoyster"),
                   Restaurant2(name: "For Kee Restaurant", image: "forkeerestaurant"),
                   Restaurant2(name: "Po's Atelier", image: "posatelier"),
                   Restaurant2(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                   Restaurant2(name: "Haigh's Chocolate", image: "haighschocolate"),
                   Restaurant2(name: "Palomino Espresso", image: "palominoespresso"),
                   Restaurant2(name: "Homei", image: "upstate"),
                   Restaurant2(name: "Traif", image: "traif"),
                   Restaurant2(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                   Restaurant2(name: "Waffle & Wolf", image: "wafflewolf"),
                   Restaurant2(name: "Five Leaves", image: "fiveleaves"),
                   Restaurant2(name: "Cafe Lore", image: "cafelore"),
                   Restaurant2(name: "Confessional", image: "confessional"),
                   Restaurant2(name: "Barrafina", image: "barrafina"),
                   Restaurant2(name: "Donostia", image: "donostia"),
                   Restaurant2(name: "Royal Oak", image: "royaloak"),
                   Restaurant2(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    
                  NavigationLink(
                    destination: RestaurantDetailView(restaurant: restaurant),
                    label: {
                        BasicImageView(restaurant: restaurant)
                    })

                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(.all,edges: .top)
            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                        // Navigate to the previous screen
//                    }) {
//                        Image(systemName: "chevron.left.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//            } }
//            }
          
            
        }
        .accentColor(.black)
    }

}

#Preview {
    NavigatinStack_Exercise()
}
