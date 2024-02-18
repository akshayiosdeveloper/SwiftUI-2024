//
//  Paths.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 18/02/24.
//

import SwiftUI

struct Paths: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 50, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 50, y: 200))
            path.closeSubpath()
            
        }
        //.fill(.green)
        .stroke(.green,lineWidth:10)
        
        Path() { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.move(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
        }
        .fill(.purple)
    }
}

#Preview {
    Paths()
}
