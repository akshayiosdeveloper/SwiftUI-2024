//
//  ArticleRowView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 09/04/24.
//

import SwiftUI

struct Article: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var author: String
    var rating: Int
    var description: String
}

struct ArticleRowView: View {
    let article: Article
    var body: some View {
        VStack(alignment:.leading,spacing: 6) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom,0)
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom,0)
            HStack(spacing:3) {
                ForEach(1...(article.rating),id:\.self) { _ in
                   Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
                
            Text(article.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        
    }
}

//#Preview {
//    
//    ArticleRowView(article: Article(image: "state-management", title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 4, description: "There are many challenges in the software development, but there is one beast that tends to screw things up much more often than the others: the problem of app’s state management and data propagation."))
//}
