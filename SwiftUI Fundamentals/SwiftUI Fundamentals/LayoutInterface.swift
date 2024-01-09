//
//  LayoutInterface.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 09/01/24.
//

import SwiftUI

struct LayoutInterface: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 30) {
            VStack(alignment:.leading, spacing: 10) {
                Text("Choose")
                    .font(.title)
                    .font(.system(size: 40))
                Text("Your Plan")
                    .font(.title)
                    .font(.system(size: 40))
            }
            HStack(spacing:20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Basic")
                        .font(.title2)
                    Text("$9")
                        .font(.title2)
                    Text("per month")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.purple)
                VStack(alignment:.leading,spacing: 10) {
                    Text("Basic")
                        .font(.title2)
                    Text("$9")
                        .font(.title2)
                    Text("per month")
                        .font(.subheadline)
                    
                }
                .padding()
                .background(Color.gray)
                
            }
            .frame(width: 200,height: 200)
            .foregroundColor(.yellow)
            .background(Color.blue)
            VStack(spacing: 10) {
                Image(systemName: "snow")
                    .resizable()
                    .frame(width: 50 ,height: 50)
                    .aspectRatio(contentMode: .fit)
                Text("TEAM")
                Text("$299")
                Text("per month")
                ZStack {
                    Text("Perfect with team 20 members")
                }
            }
            .padding()
            .background(Color.yellow)
        }
        .background(Color.pink)
    }
}

#Preview {
    LayoutInterface()
}
