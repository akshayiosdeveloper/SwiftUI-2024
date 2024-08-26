//
//  CardLayout.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/08/24.
//

import SwiftUI

struct CardLayout: View {
    var card: Card
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack(alignment: .leading) {
                    Text(card.number)
                        .bold()
                    HStack {
                        Text(card.name)
                            .bold()
                        Text("Valid Thru")
                            .font(.footnote)
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                    
                }
                    .foregroundColor(.white)
                    .padding(.leading,25)
                    .padding(.bottom , 20)
            
                ,alignment: .bottomLeading)
            .shadow(color: .gray, radius: 1.0,x: 0.0,y:1.0)
    }
}

#Preview {
    //ForEach(testCards) { card in
        CardLayout(card: testCards[0])
    //}
    
}
