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
        
        DonutView()
//        LoaderView(purpleGradient: purpleGradient)
            
        }
    
}

#Preview {
    Loader()
}

struct LoaderView: View {
    var purpleGradient: LinearGradient
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

struct DonutView: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from:0.0 , to: 0.4)
                .stroke(Color(.blue),lineWidth: 80)
            Circle()
                .trim(from:0.4 , to: 0.6)
                .stroke(Color(.systemTeal),lineWidth: 80)
            Circle()
                .trim(from:0.6 , to: 0.75)
                .stroke(Color(.yellow),lineWidth: 90)
            Circle()
                .trim(from:0.75 , to: 1)
                .stroke(Color(.purple),lineWidth: 90)
                .overlay(
                    Text("25%")
                        .font(.system(.title,design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x:80,y: -100)
                )
        }
        .frame(width: 250,height: 250)
    }
}
