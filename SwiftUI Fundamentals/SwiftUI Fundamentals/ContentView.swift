//
//  ContentView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 04/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      StateManagement()
        //ImageView()
        /*  ScrollView Excercise */
        /*
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                Group {
                    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                       
                    CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                       
                    CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                        
                    CardView(image: "natural-language-api", category: "iOS", heading: "What's Newin Natural Language API", author: "Sai Kambampati")
                }
                .frame(width:300)
            }
            Spacer()
         */
        }
    }


#Preview {
    ContentView()
        .environment(\.sizeCategory, .extraSmall)
}
