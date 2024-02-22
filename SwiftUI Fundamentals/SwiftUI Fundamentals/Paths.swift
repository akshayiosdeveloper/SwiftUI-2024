//
//  Paths.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 18/02/24.
//

import SwiftUI

struct Paths: View {
    var body: some View {
        /*
         /* Add line */
         Path() { path in
         path.move(to: CGPoint(x: 50, y: 20))
         path.addLine(to: CGPoint(x: 300, y: 20))
         path.addLine(to: CGPoint(x: 300, y: 200))
         path.addLine(to: CGPoint(x: 50, y: 200))
         path.closeSubpath()
         
         }
         //.fill(.green)
         .stroke(.green,lineWidth:10)
         */
        /*
         /* Draw a quadCurve */
         Path() { path in
         path.move(to: CGPoint(x: 20, y: 60))
         path.move(to: CGPoint(x: 40, y: 60))
         path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
         path.addLine(to: CGPoint(x: 230, y: 60))
         path.addLine(to: CGPoint(x: 230, y: 100))
         path.addLine(to: CGPoint(x: 20, y: 100))
         }
         .fill(.purple)
         
         */
        /*
         /* Pie chart */
         Path() { path in
         path.move(to: CGPoint(x: 200, y: 200))
         path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: Angle(degrees: 90), clockwise: true)
         
         }
         .fill(.green)
         */
      
        ZStack {
            Path { path in
                  path.move(to: CGPoint(x: 187, y: 187))
                  path.addArc(center: .init(x: 187, y: 187),radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
              }
              .fill(.yellow)

            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187),radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.teal)
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187),radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.blue)
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187),radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
            }
            .fill(.purple)
        }
       
    }
}

#Preview {
    Paths()
}
