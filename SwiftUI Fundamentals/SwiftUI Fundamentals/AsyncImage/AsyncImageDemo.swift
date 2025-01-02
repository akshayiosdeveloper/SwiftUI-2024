//
//  AsyncImageDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 02/01/25.
//

import SwiftUI

struct AsyncImageDemo: View {
    let imageURL =
    "https://link.appcoda.com/testimage"
    var body: some View {
        // AsyncImage(url: URL(string: imageURL))
        // AsyncImage(url: URL(string: imageURL),scale: 2.0)
        /*
         AsyncImage(url: URL(string: imageURL)) { image in
         
         image.resizable()
         .scaledToFill()
         
         } placeholder: {
         Color.purple.opacity(0.1)
         }
         .frame(width: 300, height: 500)
         .cornerRadius(20)
         */
        // AsyncImagePhase
        // is an enum that keeps track of the current phase of the download
        // operation. You can provide detailed implementation for each of the phases including
        // empty, failure, and success.
        /*
         AsyncImage(url: URL(string: imageURL)) { phase in
         switch phase {
         case .empty:
         Color.purple.opacity(0.1)
         case .success(let image):
         image
         .resizable()
         .scaledToFill()
         case .failure(_):
         Image(systemName: "exclamationmark.icloud")
         .resizable()
         .scaledToFit()
         @unknown default:
         Image(systemName: "exclamationmark.icloud")
         }
         }
         .frame(width: 300, height: 300)
         .cornerRadius(20)
         */
        
        // Animation
        AsyncImage(url: URL(string: imageURL), transaction: SwiftUI.Transaction(animation: SwiftUI.Animation.spring())) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .transition(.slide)
                
            case .failure(_):
                Image(systemName:  "ant.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 128)
                    .foregroundColor(.teal)
                    .opacity(0.6)
                
            case .empty:
                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 128)
                    .foregroundColor(.teal)
                    .opacity(0.6)
                
            @unknown default:
                ProgressView()
            }
        }
        
        .frame(width: 300, height: 500)
        .cornerRadius(20)
    }
    
}
#Preview {
    AsyncImageDemo()
}
