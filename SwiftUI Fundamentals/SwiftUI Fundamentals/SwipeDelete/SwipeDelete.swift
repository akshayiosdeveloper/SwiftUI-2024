//
//  SwipeDelete.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 22/07/24.
//

//
//  ContentView.swift
//  SwiftUIActionSheet
//
//  Created by Simon Ng on 20/7/2022.
//

import SwiftUI

struct SwipeDelete: View {
    //@State private var showActionSheet = false
    @State private var selectedRestaurant: Restaurant3?
    
    @State var restaurants = [ Restaurant3(name: "Cafe Deadend", image: "cafedeadend"),
                               Restaurant3(name: "Homei", image: "homei"),
                               Restaurant3(name: "Teakha", image: "teakha"),
                               Restaurant3(name: "Cafe Loisl", image: "cafeloisl"),
                               Restaurant3(name: "Petite Oyster", image: "petiteoyster"),
                               Restaurant3(name: "For Kee Restaurant", image: "forkeerestaurant"),
                               Restaurant3(name: "Po's Atelier", image: "posatelier"),
                               Restaurant3(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                               Restaurant3(name: "Haigh's Chocolate", image: "haighschocolate"),
                               Restaurant3(name: "Palomino Espresso", image: "palominoespresso"),
                               Restaurant3(name: "Homei", image: "upstate"),
                               Restaurant3(name: "Traif", image: "traif"),
                               Restaurant3(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
                               Restaurant3(name: "Waffle & Wolf", image: "wafflewolf"),
                               Restaurant3(name: "Five Leaves", image: "fiveleaves"),
                               Restaurant3(name: "Cafe Lore", image: "cafelore"),
                               Restaurant3(name: "Confessional", image: "confessional"),
                               Restaurant3(name: "Barrafina", image: "barrafina"),
                               Restaurant3(name: "Donostia", image: "donostia"),
                               Restaurant3(name: "Royal Oak", image: "royaloak"),
                               Restaurant3(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    
    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                BasicImageRow2(restaurant: restaurant)
                    .onTapGesture {
                       // self.showActionSheet.toggle()
                       self.selectedRestaurant = restaurant
                        
                    }
                    .actionSheet(item: self.$selectedRestaurant) { restaurant in
                        ActionSheet(title: Text("What do you want to do"), message: nil, buttons: [
                            .default(Text("Mark as Favorite"), action: {
                                self.setFavorite(item: restaurant)
                            }),
                            .destructive(Text("Delete"), action: {
                                self.delete(item: restaurant)
                            }),
                            .cancel() ])
                    }
                    
                /*
                    .actionSheet(isPresented: self.$showActionSheet, content: {
                        ActionSheet(title: Text("What do you want to do"),message: nil , buttons: [
                            .default(Text("Mark Favorite"), action: {
                                if let selectedRestaurant = self.selectedRestaurant {
                                    self.setFavorite(item: selectedRestaurant)
                                }
                            }),
                            .destructive(Text("Delete"), action: {
                                if let selectedRestaurant = self.selectedRestaurant {
                                    self.delete(item: selectedRestaurant)
                                }
                            }),
                            .cancel()
                            
                            
                            
                        ])
                 
                    })
                 */
                /*
                 .contextMenu {
                 Button(action: {
                 // delete the selected restaurant
                 self.delete(item: restaurant)
                 }) {
                 HStack {
                 Text("Delete")
                 Image(systemName: "trash")
                 }
                 }
                 Button(action: {
                 // mark the selected restaurant as favorite
                 self.setFavorite(item: restaurant)
                 }) {
                 HStack {
                 Text("Favorite")
                 Image(systemName: "star")
                 }
                 }
                 }
                 */
            }
            .onDelete(perform: { indexSet in
                restaurants.remove(atOffsets: indexSet)
            })
        }
        
        .listStyle(.plain)
    }
    private func delete(item restaurant: Restaurant3) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    private func setFavorite(item restaurant: Restaurant3) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id })
        {
            self.restaurants[index].isFavorite.toggle()
        }
        
    }
}


struct SwipeDelete_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDelete()
    }
}

struct Restaurant3: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var isFavorite: Bool = false
    
}

struct BasicImageRow2: View {
    var restaurant: Restaurant3
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
            if restaurant.isFavorite {
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}


