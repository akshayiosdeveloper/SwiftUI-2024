//
//  AnimationChallenge.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 07/03/24.
//

import SwiftUI
import OSLog
struct AnimationChallenge: View {
    static let log = OSLog(subsystem: "com.akshay.animation", category: .pointsOfInterest)
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    var body: some View {
        ZStack {
          RoundedRectangle(cornerRadius: 30)
                .frame(width: processing ? 250 : 200 ,height: 60)
                .foregroundColor(completed ? .red : .green)
            if !processing {
                Text("Submit")
                    .font(.system(.title,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .transition(.move(edge:.top))
            }
            
            if processing && !completed {
                HStack {
                    Circle()
                        .trim(from: 0, to:0.9)
                        .stroke(Color.white,lineWidth: 3)
                        .frame(width: 30,height: 30)
                        .rotationEffect(.degrees(loading ? 360 : 0))
                        .animation(.easeOut.repeatForever(autoreverses: false),value: loading)
                    Text("Processing")
                        .font(.system(.title,design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
                .transition(.opacity)
                .onAppear() {
                    self.startProcessing()
                }
            }
            if completed {
                Text("Done")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .onAppear() {
                    self.endProcessing()
                }
            }
        }
        .animation(.spring(), value: loading)
        .onTapGesture {
            if !loading {
                self.processing.toggle()
            }
        }
    }
    
    private func startProcessing() {
        os_signpost(.begin,log: AnimationChallenge.log,name: "start processing")
        self.loading = true
        
        // Simulate an operation by using DispatchQueue.main.asyncAfter
        // In a real world project, you will perform a task here.
        // When the task finishes, you set the completed status to true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.completed = true
        }
    }
    
    private func endProcessing() {
        // Reset the button's state
        os_signpost(.end,log: AnimationChallenge.log,name: "end processing")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.processing = false
            self.completed = false
            self.loading = false
           
        }
        
    }
}

#Preview {
    AnimationChallenge()
}
