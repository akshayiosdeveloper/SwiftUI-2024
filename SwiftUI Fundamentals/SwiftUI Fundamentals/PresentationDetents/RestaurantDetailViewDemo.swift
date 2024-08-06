//
//  RestaurantDetailView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 06/08/24.
//

import SwiftUI

struct RestaurantDetailViewDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RestaurantDetailViewDemo()
}

struct HandleBar: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
    }
}

