//
//  ContentView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 04/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Image(systemName: "cloud.heavyrain")
        //            .font(.system(size: 200))
        //            .foregroundColor(.blue)
        //            .shadow(color: .gray, radius: 10,x: 10,y: 10)
//        Image("flipbox")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 300)
//            .overlay(
//                Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveab le feast.\n\n- Ernest Hemingway")
//                    .fontWeight(.heavy)
//                    .font(.system(.headline, design: .rounded))
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.black)
//                    .cornerRadius(10)
//                    .opacity(0.8)
//                    .padding(),
//                alignment: .top
//            )
//        Image("flipbox")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .overlay(
//                Color.black
//                    .opacity(0.6)
//        )
        Image("flipbox")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .overlay(
                Color.black
                    .opacity(0.4)
                    .overlay(
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(width: 200)
        ) )
    }
}

#Preview {
    ContentView()
        .environment(\.sizeCategory, .extraSmall)
}
