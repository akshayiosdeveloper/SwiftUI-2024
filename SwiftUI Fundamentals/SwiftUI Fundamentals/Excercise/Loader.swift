//
//  Loader.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 24/02/24.
//

import SwiftUI

struct Loader: View {
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color (red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255,
                                                                                                                                        blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    var body: some View {
        ZStack {
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/ ,to: 0.85)
                .stroke(purpleGradient,lineWidth: 20)
                .frame(width:300,height: 300)
                .overlay {
                    VStack {
                        Text("85%")
                            .font(.system(size: 80,weight: .bold,design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(.body,design: .rounded))
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
            
        }
    }
}

#Preview {
    Loader()
}
