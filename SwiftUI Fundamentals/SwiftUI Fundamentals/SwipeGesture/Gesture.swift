//
//  Gesture.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 01/08/24.
//

import SwiftUI
/*
struct Gesture: View {
    @State private var isPressed = false
    @GestureState private var longPressTap = false
    @GestureState private var dragOffset = CGSize.zero
    @GestureState private var position = CGSize.zero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .offset(x: dragOffset.width ,y: dragOffset.height)
            //.opacity(longPressTap ? 0.4 : 1.0)
            //.scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut, value: dragOffset)
            .foregroundColor(.green)
            .gesture(
                /*
                 // tap gesture
                 TapGesture()
                 .onEnded({
                 self.isPressed.toggle()
                 })
                 */
                /*
                // Long press gesture
                
                LongPressGesture(minimumDuration: 1.0)
                
                    .updating($longPressTap, body: { (currentState, state, transaction) in state = currentState
                    })
                    .onEnded({ _ in
                        self.isPressed.toggle()
                    })
                 */
                
                DragGesture()
                    .updating($dragOffset, body: { value, state, transaction in
                        state = value.translation
                    })
                    .onEnded({ (value) in
//                        var pos =  self.position
//                        pos.height = self.position.height + value.translation.height
//                        self.position = pos
//                        self.position.width += value.translation.width

                    })
            )
    }
}
*/
struct Gesture:View {
    @GestureState private var isPressed = false
       // For drag gesture
       @GestureState private var dragOffset = CGSize.zero
       @State private var position = CGSize.zero
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(isPressed ? 0.5 : 1.0)
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .animation(.easeInOut, value: dragOffset)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .updating($isPressed, body: { (currentState, state, transaction) in
                        state = currentState
                    })
                    .sequenced(before: DragGesture())
                    .updating($dragOffset, body: { (value, state, transaction) in
                        switch value {
                        case .first(true):
                            print("Tapping")
                        case .second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    })
                    .onEnded({ (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    })
            )
        
    }
                
}

#Preview {
    Gesture()
}
