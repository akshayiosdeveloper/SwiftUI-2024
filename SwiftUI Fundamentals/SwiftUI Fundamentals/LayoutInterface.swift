//
//  LayoutInterface.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 09/01/24.
//

import SwiftUI

struct LayoutInterface: View {
    var body: some View {
     
       
        VStack(spacing: 30) {
            HeaderView()
            //HStack(spacing:20) {
            HStack() {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: (Color(red: 240/255, green: 240/255, blue: 240/255)))
                    Text("Best for designer")
                        .font(.system(.caption,design: .rounded))
                        .fontWeight(.bold)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x:0,y:87)
                }
                
            }
            .padding(.horizontal)
            ZStack {
                PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255),icon: "wand.and.rays")
                Text("Perfect for teams with 20 members")
                    .font(.system(.caption,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x:0,y:110)
            }
            .padding()
            Spacer()
            
        }
        
        .background(Color.pink)
         
    }
}

#Preview {
    LayoutInterface()
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.black)
                
                Text("Your Plan")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
            
        }
    }
}

struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    var body: some View {
        VStack() {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity , minHeight:100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
