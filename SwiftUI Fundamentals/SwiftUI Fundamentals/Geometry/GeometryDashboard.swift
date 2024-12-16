//
//  GeometryDashboard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 16/12/24.
//

import SwiftUI

struct GeometryDashboard: View {
    @Namespace private var shapeTransition
    @State private var expand = false
    var body: some View {
        
        //circleViewWithOldApproach()
        circleViewWithNewApproachGeometryEffectView()
        
        

    }
    
    private func circleViewWithOldApproach() -> some View {
        // with old approach
        Circle()
            .fill(Color.green)
            .frame(width: expand ? 300 : 150, height: expand ? 300 : 150)
            .offset(y: expand ? -200 : 0)
            .animation(.default, value: expand)
            .onTapGesture {
                self.expand.toggle()
            }
    }
    
    
     func circleViewWithNewApproachGeometryEffectView() -> some View {
        // with new approched (matchedGeometryEffect)
        if expand {
            // Final State
            Circle()
                .fill(Color.green)
                .matchedGeometryEffect(id: "circle", in: shapeTransition)
                .frame(width: 300, height: 300)
                .offset(y: -200)
                .onTapGesture {
                    withAnimation(.easeIn) {
                        expand.toggle()
                    }
                }
        } else {
            // Start State
            Circle()
                .fill(Color.green)
                .matchedGeometryEffect(id: "circle", in: shapeTransition)
                .frame(width: 150, height: 150)
                .offset(y: 0)
                .onTapGesture {
                    withAnimation(.easeIn) {
                        expand.toggle()
                        
                    }
                }
        }
    }
}

#Preview {
    GeometryDashboard()
}
