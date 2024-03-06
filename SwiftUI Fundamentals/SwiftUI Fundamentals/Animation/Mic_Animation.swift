//
//  Mic_Animation.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 06/03/24.
//

import SwiftUI

struct Mic_Animation: View {
    @State private var recordingBegin = false
    @State private var recording = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: recordingBegin ? 30 : 5)
                .frame(width: recordingBegin ? 60 : 250,height: 60)
                .foregroundColor(recordingBegin ? .red : .green)
                .overlay(
                Image(systemName: "mic.fill")
                    .font(.system(.title))
                    .foregroundColor(.white)
                    .scaleEffect(recording ? 0.7 : 1)
                )
            
            RoundedRectangle(cornerRadius: recordingBegin ? 35 : 10)
                .trim(from:0,to: recordingBegin ? 0.0001 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordingBegin ? 70 : 260 , height: 70)
                .foregroundColor(.green)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.recordingBegin.toggle()
           }
            withAnimation(.spring().repeatForever().delay(0.3)) {
                self.recording.toggle()
            }
        }
    }
}

#Preview {
    Mic_Animation()
}
