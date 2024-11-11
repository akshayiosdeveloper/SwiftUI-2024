//
//  GridLayoutDashboard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 11/11/24.
//

import SwiftUI

struct GridLayoutDashboard: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
   // private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    private var sixColumnGrid:[GridItem] = Array(repeating: .init(.flexible()), count: 6)
    private var adaptiveGrid = [GridItem(.adaptive(minimum:50))]
    private var gridItemLayoutWithFixedLayout = [GridItem(.fixed(100)), GridItem(.fixed(150))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayoutWithFixedLayout, spacing: 20) {
                ForEach((0...100), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth:0, maxWidth: .infinity,minHeight: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
    
}


#Preview {
    GridLayoutDashboard()
}
