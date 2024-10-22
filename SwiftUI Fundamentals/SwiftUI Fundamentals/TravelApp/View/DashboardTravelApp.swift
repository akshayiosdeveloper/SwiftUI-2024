//
//  DashboardTravelApp.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 18/10/24.
//

import SwiftUI

struct DashboardTravelApp: View {
    @State private var isCardTapped = false
    @State private var currentTripIndex = 2
    @GestureState private var dragOffset: CGFloat = 0
    var body: some View {
        GeometryReader { outerView in
            HStack(spacing: 0) {
                ForEach(sampleTrips1.indices, id: \.self) { index in
                    GeometryReader { innerView in
                        TripCardView(destination: sampleTrips1[index].destination, imageName: sampleTrips1[index].image, isShowDetails: self.$isCardTapped)
                            .offset(y: self.isCardTapped ? -innerView.size.height * 0.3 : 0)
                    }
                    .padding(.horizontal, self.isCardTapped ? 0 : 20)
                    .opacity(self.currentTripIndex == index ? 1.0 : 0.7)
                    .frame(width: outerView.size.width, height: self.currentTripIndex == index ? (self.isCardTapped ? outerView.size.height : 450) : 400)
                    .onTapGesture {
                        self.isCardTapped = true
                    }
                }
            }
            .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
            .offset(x: -CGFloat(self.currentTripIndex) * outerView.size.width)
            .offset(x: self.dragOffset)
            .gesture(
                !self.isCardTapped ?
                    
                DragGesture()
                    .updating(self.$dragOffset, body: { (value, state, transaction) in
                        state = value.translation.width
                    })
                    .onEnded({ (value) in
                        let threshold = outerView.size.width * 0.65
                        var newIndex = Int(-value.translation.width / threshold) + self.currentTripIndex
                        newIndex = min(max(newIndex, 0), sampleTrips1.count - 1)
                        
                        self.currentTripIndex = newIndex
                    })
                
                : nil
            )
        }
        .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3), value: dragOffset)
    }
}
#Preview {
    DashboardTravelApp()
}
