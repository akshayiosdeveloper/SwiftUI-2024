//
//  ContentView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 04/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("VStack")
                .font(.largeTitle)
            Text("Alignment")
                .font(.title)
                .foregroundColor(.gray)
            Text("By default, views in a VStack are center aligned.")
            VStack(alignment: .leading, spacing: 40) {
                Text("Leading Alignment")
                    .font(.title)
                Divider() // Creates a thin line (Push-out view)
                Image(systemName: "arrow.left")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue))
            .padding()
            VStack(alignment: .trailing, spacing: 40) {
                Text("Trailing Alignment")
                    .font(.title)
                Divider()
                Image(systemName: "arrow.right")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue))
            .padding()
            VStack(alignment:.trailing,spacing:10) {
                Text("Hello")
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(.gray)
            }
        }
        .font(.title)
       }
}

#Preview {
    ContentView()
        .environment(\.sizeCategory, .extraSmall)
}
