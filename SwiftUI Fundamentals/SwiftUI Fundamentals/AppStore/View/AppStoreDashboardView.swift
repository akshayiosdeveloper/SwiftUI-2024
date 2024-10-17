//
//  AppStoreDashboardView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 17/10/24.
//

import SwiftUI

struct AppStoreDashboardView: View {
    @Namespace var nsArticle
    
    @State private var selectedArticleIndex: Int?
    @State private var showContent = false
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 40) {
                    
                    TopBarView()
                        .padding(.horizontal, 20)
                    
                    ForEach(sampleArticles1.indices, id: \.self) { index in
                        
                        AppStoreCardView(category: sampleArticles1[index].category, headline: sampleArticles1[index].headline, subHeadline: sampleArticles1[index].subHeadline, image: sampleArticles1[index].image, content: sampleArticles1[index].content, isShowContent: $showContent)
                        
                            .padding(.horizontal, 20)
                            .matchedGeometryEffect(id: index, in: nsArticle)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.35, dampingFraction: 0.65, blendDuration: 0.1)) {
                                    self.selectedArticleIndex = index
                                    self.showContent.toggle()
                                }
                            }
                            .frame(height: min(sampleArticles1[index].image.size.height/3, 500))
                    }
                }
            }
            .opacity(showContent ? 0 : 1)
            
            if showContent,
               let selectedArticleIndex {
                AppStoreCardView(category: sampleArticles1[selectedArticleIndex].category, headline: sampleArticles1[selectedArticleIndex].headline, subHeadline: sampleArticles1[selectedArticleIndex].subHeadline, image: sampleArticles1[selectedArticleIndex].image, content: sampleArticles1[selectedArticleIndex].content, isShowContent: $showContent)
                    .matchedGeometryEffect(id: selectedArticleIndex, in: nsArticle)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    AppStoreDashboardView()
}

struct TopBarView : View {
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            
            Spacer()
            
            AvatarView(image: "profile", width: 40, height: 40)
            
        }
    }
    
    func getCurrentDate(with format: String = "EEEE, MMM d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}
struct AvatarView: View {
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
    }
}
