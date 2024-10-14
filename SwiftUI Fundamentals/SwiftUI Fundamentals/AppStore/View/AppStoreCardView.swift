//
//  AppStoreCard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 14/10/24.
//

import SwiftUI

struct AppStoreCardView: View {
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage?
    var content: String = ""
    @Binding var isShowContent: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text(self.category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            Text(self.headline)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            if !self.isShowContent {
                                Text(self.subHeadline)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                        }
                        .padding()
                        Spacer()
                    }
                    
                )
        }
        .foregroundColor(.white)
        
    }
}


#Preview {
    AppStoreCardView(category: sampleArticles1[0].category, headline: sampleArticles1[0].headline, subHeadline: sampleArticles1[0].subHeadline, image: nil, isShowContent: .constant(false)).previewLayout(.fixed(width: 380, height: 500))
}
