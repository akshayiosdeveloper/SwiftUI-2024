//
//  StateManagement.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 12/02/24.
//

import SwiftUI

struct StateManagement: View {
  @State  private var isPlaying = true
  @State  private var redCounter = 0
  @State  private var blueCounter = 0
   @State  private var greenCounter = 0
    var body: some View {
        VStack {
            let sum = redCounter + blueCounter + greenCounter
            Text("\(sum)")
                .font(.system(size: 50,weight: .bold,design: .monospaced))
            HStack {
                ButtonCounter(counter: $redCounter, color: .red)
                ButtonCounter(counter: $blueCounter, color: .yellow)
                ButtonCounter(counter: $greenCounter, color: .green)
            }
        }


    }
}

#Preview {
    StateManagement()
}

struct ButtonCounter : View {
    @Binding  var counter : Int
    var color:Color
    var body: some View {
        Button(action: {
            self.counter = counter + 1;
            
        }, label: {
            VStack {
             
               Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .foregroundColor(color)
                    .overlay {
                        Text("\(counter)")
                            .font(.system(size: 50,weight: .bold,design: .rounded))
                            .foregroundColor(.white)
                    }
               
            }
        })
    }
}
