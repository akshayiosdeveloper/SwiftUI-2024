//
//  ContentView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 04/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    VStack(spacing: 20.0) {
//    HeaderView("LazyVStack",
//    subtitle: "Alignment",
//    desc: "Since LazyVStacks are push-out views (horizontally) the alignment
//    parameter could be useful.")
    Text("Leading")
    LazyVStack(alignment: .leading, spacing: 40) {
    Image(systemName: "1.circle")
    Image(systemName: "2.circle")
    Image(systemName: "3.circle")
    }
    .border(Color.red, width: 2) // Draws a border around the frame of the view
    Text("Trailing")
    LazyVStack(alignment: .trailing, spacing: 40) {
    Image(systemName: "1.circle")
    Image(systemName: "2.circle")
    Image(systemName: "3.circle")
    }
    }
    .border(Color.red, width: 2)
    .font(.title)
    }
}

#Preview {
    ContentView()
        .environment(\.sizeCategory, .extraSmall)
}
