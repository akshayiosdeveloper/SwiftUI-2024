//
//  TabBarDashboard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 02/01/25.
//

import SwiftUI

struct TabBarDashboard: View {
    @State private var selection: Int = 0
    var body: some View {
        ZStack(alignment:.topTrailing) {
           NavigationStack {
                
            
            TabView(selection: $selection) {
                List(1...10, id: \.self) { index in
                    NavigationLink(
                        destination: Text("Item #\(index) Details"),
                        label: {
                            Text("Item #\(index)")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        })
                }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
                Text("Bookmark Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "bookmark.circle.fill")
                        Text("Bookmark")
                    }
                    .tag(1)
                
                Text("Video Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "video.circle.fill")
                        Text("Video")
                    }
                    .tag(2)
                
                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .tag(3)
            }
            .accentColor(.red)
            .navigationTitle("Tab Bar Demo")

        }
            Button {
                selection = (selection + 1) % 4
            } label: {
                Text("Next")
                    .font(.system(.headline, design: .rounded))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .padding()
            }
        }
    }
    
}

#Preview {
    TabBarDashboard()
}
