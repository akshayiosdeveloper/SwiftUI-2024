//
//  TinderCardView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 08/08/24.
//

import SwiftUI

struct TinderCardView: View ,Identifiable {
    let id = UUID()
    let image: String
    let title: String
    
    
    var body: some View {
       Image(image)
            .resizable()
            .scaledToFill()
            .frame(minWidth:0, maxWidth: .infinity)
            .cornerRadius(10)
            .padding(.horizontal,15)
            .overlay(alignment: .bottom) {
                VStack {
                    Text(title)
                        .font(.system(.headline,design: .rounded))
                        .fontWeight(.bold)
                        .padding(.horizontal,30)
                        .padding(.vertical,10)
                        .background(Color.white)
                        .cornerRadius(5)
                    
                }
                .padding([.bottom],20)
            }
    }
}

//#Preview {
////    let trip = trips[0]
////    TinderCardView(image: trip.image, title: trip.destination)
//}
