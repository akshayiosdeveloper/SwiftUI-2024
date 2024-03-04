//
//  MediumLoader.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 04/03/24.
//

import SwiftUI

struct MediumLoader: View {
   @State private var isLoading = false
    var body: some View {
        
        
        ZStack {
            Circle()
                .stroke(Color(.systemGray5),lineWidth: 14)
                .frame(width: 100,height: 100)
            Circle()
                .trim(from: 0,to: 0.2)
                .stroke(Color.green,lineWidth: 7)
                .frame(width: 100,height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0 ))
                //.animation(.default.repeatForever(autoreverses: false),value: isLoading)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(perform: {
                    isLoading = true
            })
        }
        
    }
    
 
}

#Preview {
    MediumLoader()
}
