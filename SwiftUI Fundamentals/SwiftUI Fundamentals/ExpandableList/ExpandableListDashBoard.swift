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
            OutlineGroup(sampleMenuItems,children: \.subMenuItems) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 50)
                    
                    Text(item.name)
                        .font(.system(.title3,design: .rounded))
                        .bold()
                }
                
            }
            
        }
    }
}
#Preview {
    ExpandableListDashBoard()
}
