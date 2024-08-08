//
//  TopBarMenu.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 08/08/24.
//

import SwiftUI

struct TopBarMenu: View {
    var body: some View {
        HStack {
         Image(systemName: "line.horizontal.3")
                .font(.system(size: 30))
            Spacer()
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size:35))
            Spacer()
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 30))
        }
        .padding()
    }
}

#Preview {
    TopBarMenu()
}
