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
           
                PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: (Color(red: 240/255, green: 240/255, blue: 240/255)))
                
            }
            .padding(.horizontal)
            .background(Color.yellow)
            VStack(spacing: 10) {
                Image(systemName: "snow")
                    .resizable()
                    .frame(width: 50 ,height: 50)
                    .aspectRatio(contentMode: .fit)
                Text("TEAM")
                Text("$299")
                Text("per month")
                ZStack {
                    Text("Perfect with team 20 members")
                }
            }
            .padding()
            .background(Color.yellow)
        }
        .padding()
        .background(Color.pink)
         
    }
}

#Preview {
    LayoutInterface()
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 2) {
            Text("Choose")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.black)
            
            Text("Your Plan")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(.black)
        }
    }
}

struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var body: some View {
        VStack() {
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
