//
//  Transistion.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 07/03/24.
//

import SwiftUI

struct Transistion: View {
    @State private var show = false
    
    var body: some View {
        VStack {
        RoundedRectangle(cornerRadius: 10)
                .frame(width: 300,height: 300)
                .foregroundColor(.green)
                .overlay {
                    Text("Show details")
                        .font(.system(.largeTitle,design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300,height: 300)
                    .foregroundColor(.purple)
                    .overlay{
                        Text("Well, here is the details")
                            .font(.system(.largeTitle,design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    }
                    //.transition(.scale(scale: 0, anchor: .bottom))
                   // .transition(scale.offset(x: -600,y:0))
                   // .transition(AnyTransition.offset(x: -600, y: 0).combined(with: .scale))
                   // .transition(AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
                   // .transition(.offsetScaleOpacity)
                    .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0)))
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.show.toggle()
            }
        }
    }
}
extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}
#Preview {
    Transistion()
}
