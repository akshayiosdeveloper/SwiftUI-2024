//
//  ExpandableListDashBoard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 23/10/24.
//

import SwiftUI

struct ExpandableListDashBoard: View {
    var body: some View {
        List {
            ForEach(sampleMenuItems) { menuItem in
                Section(header:
                            HStack {
                    Text(menuItem.name)
                        .font(.title3)
                        .fontWeight(.heavy)
                    Image(menuItem.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                    .padding(.vertical))
                {
                    OutlineGroup(menuItem.subMenuItems ?? [MenuItem1](), children: \.subMenuItems) {  item in
                        
                        HStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(item.name)
                                .font(.system(.title3, design: .rounded))
                                .bold()
                        }
                    }
                }
            }
        }
        
    }
}
#Preview {
    ExpandableListDashBoard()
}
