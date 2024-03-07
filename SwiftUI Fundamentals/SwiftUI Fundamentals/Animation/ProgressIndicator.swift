//
//  ProgressIndicator.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 06/03/24.
//

import SwiftUI

struct ProgressIndicator: View {
    @State private var progress: CGFloat = 0.0
    var body: some View {
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.title,design: .rounded))
                .bold()
            Circle()
                .stroke(Color(.systemGray5),lineWidth: 10)
                .frame(width: 150,height: 150)
            
            Circle()
                .trim(from: 0.0 , to: progress)
                .stroke(Color.green,lineWidth: 10)
                .frame(width: 150,height: 150)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                if self.progress >= 0.90 {
                    timer.invalidate()
                }
                self.progress += 0.05
                print(self.progress)
                
            }
            //Animation.default.delay(1.0)
        }
    }
}

#Preview {
    ProgressIndicator()
}
