//
//  SearchableDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 03/01/25.
//

import SwiftUI

struct SearchableDemo: View {
    @State var sampleArticles = articles
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(sampleArticles) { article in
                    ArticleRowView(article: article)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("searchabble demo")
        }
        .searchable(text: $searchText) {
            Text("iOS").searchCompletion("iOS")
            Text("Android").searchCompletion("Android")
        }
        .onChange(of: searchText) { searchText in
            print(searchText)
            if !searchText.isEmpty {
                sampleArticles = articles.filter { $0.title.contains(searchText) }
                print("count:\(sampleArticles.count)")
                print(sampleArticles)
            } else {
                sampleArticles = articles
            }
        }
      //  .searchable(text: $searchText, prompt: "Search articles...")
      //  .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    SearchableDemo()
}
