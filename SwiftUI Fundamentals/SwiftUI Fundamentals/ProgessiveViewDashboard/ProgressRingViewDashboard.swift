//
//  ProgressRingViewDashboard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 25/11/24.
//

import SwiftUI

struct ProgressRingViewDashboard: View {
    var thickness: CGFloat = 30.0
    var width: CGFloat = 250.0
    var startAngle: Double = -90.0
    var gradient = Gradient(colors: [.darkPurple, .lightYellow])
    @Binding var progress: Double
    var body: some View {
        ZStack {
            Circle().stroke(Color(.systemGray6),lineWidth: thickness)
            RingShape(progress: progress, thickness: thickness) .fill(AngularGradient(gradient: gradient, center: .center, startAngle: .degrees(startAngle), endAngle: .degrees(360 * progress + startAngle)))
        }
        .frame(width: width , height: width ,alignment: .center)
    }
}
struct RingShape: Shape {
    var progress: Double = 0.0
    var thickness: CGFloat = 30.0
    var startAngle: Double = -90.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0), radius: min(rect.width, rect.height) / 2.0,
        startAngle: .degrees(startAngle),
        endAngle: .degrees(360 * progress + startAngle), clockwise: false)
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
}
//struct ProgressRingViewDashboard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressRingViewDashboard(progress: .constant(0.5))
//            .previewDisplayName("ProgressRingView (50%)")
//        ProgressRingViewDashboard(progress: .constant(0.9))
//            .previewDisplayName("ProgressRingView (90%)")
//    }
//}
