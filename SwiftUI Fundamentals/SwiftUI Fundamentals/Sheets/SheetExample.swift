//
//  SheetExample.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 18/04/24.
//

import SwiftUI

struct SheetExample: View {

   // @State var showDetailView = false
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationStack {
            List(articles) { article in
             ArticleRowView(article: article)
                    .onTapGesture {
                       // self.showDetailView = true
                        self.selectedArticle = article
                    }
            }
            .listStyle(.plain)
            // first way to represent the modal view
//            .sheet(isPresented: $showDetailView, content: {
//                if let selectedArticle = self.selectedArticle {
//                    ArticleDetailView(article: selectedArticle)
//                }
//            })
            // second way to represent the modal view
            //.sheet(item: $selectedArticle, content: { article in
               // ArticleDetailView(article: article)
           // })
            .fullScreenCover(item: $selectedArticle, content: { article in
                ArticleDetailView(article: article)
            })
            .navigationTitle("Your Reading!!!")
        }
    }
}

#Preview {
    SheetExample()
}

#if DEBUG
var articles = [
    Article(image: "state-management", title: "Android", author: "Alexey Naumov", rating: 4, description: "Hello and welcome to a new tutorial! One of the most common concepts met and used in Swift by all developers is protocols, and I don’t think there’s even one developer who doesn’t know about them. Protocols can be used to serve various purposes, however, what remains always the same is what the documentation from Apple says:\n\nA protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.\n\nIn fewer words, a Swift protocol defines a number of methods and properties that the adopting types (classes, structures, enumerations) must implement. All those defined methods and properties are called requirements."),
    Article(image: "macos-programming", title: "iOS", author: "Akshay", rating: 3, description: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier. Say, for example, you want to create a button like this.\n\nWe can apply the border modifier on a button object to create a button with a coloured border.\n\nBut what if your designer wants you to create a rounded border button like this? How can you do that?\n\nIn the code, we use a RoundedRectangle and its stroke modifier to create the rounded border. You can modify the color and line width to adjust its appearance."),
    Article(image: "swiftui-button", title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 2, description: "Welcome to another tutorial where we’ll keep exploring fundamental stuff on macOS programming world. Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls.\n\nI don’t think there’s ever existed a meaningful application without using any kind of text control. Labels, text fields and text views are types of UI controls that are met in every application, even if not all of them are present. Due to their purpose and their intended use, text controls are usually of the first ones developers use into an app. And even though there’s not any kind of mystery or magic hidden and using them is relatively straightforward, a post dedicated to text controls is necessary so we have the chance to walk through their specific details and clear a few things out."),
    Article(image: "flutter-app", title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 1, description: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial. In today’s tutorial, we will build an app with complex UI with the Flutter framework. We will explore quite a lot of components. By going through the tutorial, you will learn to implement: Textfields with Validation, Carousel Slider, Complex List View, etc.\n\nIf any of the above raises your eyebrow, then you are here at the right place! Tighten your seatbelt as this tutorial will take you on a ride to learn all these concepts, by building an app called Moments.")

]
#endif
