//
//  RestaurantDetailView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 06/08/24.
//

import SwiftUI

struct RestaurantDetailViewDemo: View {
    let restaurant: RestaurantDemo
    var body: some View {
        VStack {
            Spacer()
            HandleBar()
            TitleBar()
            HeaderView123(restaurant: self.restaurant)
            DetailInfoView(icon: "map", info: "India")
                .padding(.top)
            DetailInfoView(icon: "phone", info: self.restaurant.phone) 
            DetailInfoView(icon: nil, info: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32")
                .padding(.top)
        }
        .background(Color.white)
        .cornerRadius(10, antialiased: true)
    }
}
   
#Preview {
    RestaurantDetailViewDemo(restaurant:FormDemo().restaurants[0])
}

struct HandleBar: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
    }
}

struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            Spacer() }
        .padding() }
}

struct HeaderView123: View {
    let restaurant: RestaurantDemo
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        Text(restaurant.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                    Spacer() }
                    .padding() )
    }
}

struct DetailInfoView: View {
    let icon: String?
    let info: String
    var body: some View  {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
                
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            Spacer()
            
        }.padding(.horizontal)
        
    }
}
