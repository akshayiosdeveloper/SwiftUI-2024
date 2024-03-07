//
//  Animation.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 28/02/24.
//

import SwiftUI

struct Animation: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChange = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        /* Implicit Animation */
        /*
        ZStack {
            Circle()
                .frame(width: 200,height: 200)
                .foregroundColor(circleColorChanged ? Color(.gray): .red)
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChange ? .red : .white)
                .font(.system(size:100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                
        }
        .animation(.spring, value: heartColorChange)
        .animation(.easeOut, value: heartSizeChanged)
        .onTapGesture {
            circleColorChanged.toggle()
            heartColorChange.toggle()
            heartSizeChanged.toggle()
        }
         */
     
        ZStack {
            Circle()
                .frame(width: 200,height: 200)
                .foregroundColor(circleColorChanged ? Color(.gray): .red)
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChange ? .red : .white)
                .font(.system(size:100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
//            withAnimation(.default) {
//                circleColorChanged.toggle()
//                heartColorChange.toggle()
//                heartSizeChanged.toggle()
//            }
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)
            ){
                self.heartSizeChanged.toggle()
            }
            self.circleColorChanged.toggle()
                self.heartColorChange.toggle()
            }
           
        /*
        ZStack {
            Circle()
        .frame(width: 200, height: 200)
        .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red) .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3
        ), value: circleColorChanged)
        Image(systemName: "heart.fill")
        .foregroundColor(heartColorChange ? .red : .white)
        .font(.system(size: 100))
        .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3
        ), value: heartColorChange)
                
        }
        .onTapGesture {
            self.circleColorChanged.toggle()
            self.heartColorChange.toggle()
            self.heartSizeChanged.toggle()
        }
       */
    }
}

#Preview {
    Animation()
}
