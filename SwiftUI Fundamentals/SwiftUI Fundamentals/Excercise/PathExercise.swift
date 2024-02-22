//
//  PathExcercise.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 22/02/24.
//

import SwiftUI

struct PathExercise: View {
    var body: some View {
        Dome()
        Path() { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -30))
            path.addLine(to: CGPoint(x: 200, y: 0))
            path.addLine(to: CGPoint(x: 200, y: 40))
            path.addLine(to: CGPoint(x: 0, y: 40))
            
        }
        .fill(.green)
        
        Path() { path in
        path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
            path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
        }
        .fill(Color.green)
    }
}
struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint( x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
return path }
}

#Preview {
    PathExercise()
}
