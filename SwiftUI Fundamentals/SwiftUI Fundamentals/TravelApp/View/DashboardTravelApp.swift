//
//  DashboardTravelApp.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 18/10/24.
//

import SwiftUI

struct DashboardTravelApp: View {
    @State private var isCardTapped = false
    var body: some View {
        GeometryReader { outerView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(sampleTrips1.indices, id: \.self) { index in
                        GeometryReader { innerView in
                            TripCardView(destination: sampleTrips1[index].destination, imageName: sampleTrips1[index].image, isShowDetails: self.$isCardTapped)
                        }
                        .padding(.horizontal, 20)
                        .frame(width: outerView.size.width, height: 450)
                    }
                }
            }
            
            .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
        }
    }
}

#Preview {
    DashboardTravelApp()
}
