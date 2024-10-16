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
    let image: UIImage
    var content: String = ""
    @Binding var isShowContent: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width,height: min(self.image.size.height/3 , 500))
                            .border(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), width: self.isShowContent ? 0 : 1)
                            .cornerRadius(15)
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
                                        if self.isShowContent {
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
                                    .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3), radius: self.isShowContent ? 0 : 15)
                                
                            )
                    }
                    .foregroundColor(.white)
                }
            } // Z STACK
            
            .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3), radius: self.isShowContent ? 0 : 15)
            if self.isShowContent {
                // close button
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut) {
                            self.isShowContent = false
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 26))
                            .foregroundColor(.white)
                            .opacity(0.7)
                    } }
                .padding(.top, 50)
                .padding(.trailing)
            }
        }
        
    }
}


#Preview {
    AppStoreCardView(category: sampleArticles1[0].category, headline: sampleArticles1[0].headline, subHeadline: sampleArticles1[0].subHeadline, image:  sampleArticles1[0].image, isShowContent: .constant(false)).previewLayout(.fixed(width: 380, height: 500))
}
