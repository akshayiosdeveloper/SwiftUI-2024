//
//  ListView_Exercise.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 09/04/24.
//

import SwiftUI

struct ListView_Exercise: View {
    var articles = [
        Article(image: "state-management", title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 4, description: "There are many challenges in the software development, but there is one beast that tends to screw things up much more often than the others: the problem of app’s state management and data propagation."),
        Article(image: "macos-programming", title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 5, description: "There are many challenges in the software development, but there is one beast that tends to screw things up much more often than the others: the problem of app’s state management and data propagation."),
        Article(image: "swiftui-button", title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 2, description: "There are many challenges in the software development, but there is one beast that tends to screw things up much more often than the others: the problem of app’s state management and data propagation."),
        Article(image: "flutter-app", title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 1, description: "There are many challenges in the software development, but there is one beast that tends to screw things up much more often than the others: the problem of app’s state management and data propagation.")
    
    ]
    var body: some View {
        List(articles) { article in
         ArticleRowView(article: article)
        }
    }
}


#Preview {
    ListView_Exercise()
}
