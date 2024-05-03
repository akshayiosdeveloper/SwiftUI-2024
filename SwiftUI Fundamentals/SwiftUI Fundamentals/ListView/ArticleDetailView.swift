//
//  ArticleDetailView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 18/04/24.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.description)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
            
        }
        .overlay(
            HStack {
                Spacer()
                
                VStack {
                    Button {
                      // dismiss()
                        showAlert = true
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 40)
                    Spacer()
                    
                }
            }
        )
        .alert("Warning", isPresented: $showAlert, actions: { Button {
                dismiss()
            } label: {
                Text("Confirm")
            }
            Button(role: .cancel, action: {}) {
                Text("Cancel")
            }
        }, message: {
            Text("Are you sure you want to leave?")
        })
        .ignoresSafeArea(.all, edges: .top)
        
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}

