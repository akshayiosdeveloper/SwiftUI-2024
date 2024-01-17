//
//  CardView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 17/01/24.
//

import SwiftUI

struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    var body: some View {
        VStack {
            HStack {
                VStack(alignment:.leading,spacing: 10) {
                    Text("Monday,AUG 20")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("Your Reading")
                        .font(.title)
                        .fontWeight(.black)
                }
                Spacer()
            }
            .padding()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment:.leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text("Written by \(author)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            
        }
        .cornerRadius(10)
        .overlay(RoundedRectangle(
            cornerRadius: 10)
            .stroke(Color(.sRGB,red:150/255,green: 150/255,blue: 150/255,opacity: 0.1),lineWidth: 1)
        )
        .padding([.top,.horizontal])
    }
}

#Preview {
    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corner", author: "Simon Ng")
}
