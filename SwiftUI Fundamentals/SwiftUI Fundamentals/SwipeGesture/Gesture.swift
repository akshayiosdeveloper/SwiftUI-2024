//
//  Gesture.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 01/08/24.
//

import SwiftUI
enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive , .pressing:
            return .zero
           
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPresenting: Bool {
        switch self {
        case .pressing,.dragging:
            return true
        case .inactive:
            return false
        }
    }
    
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
    
    var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
    }
    }
}
struct Gesture: View {
    @GestureState private var dragState = DragState.inactive
    @State private var position = CGSize.zero
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut, value: dragState.translation) .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: { (value, state, transaction) in
                        switch value {
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero) default:
                            break } })
                    .onEnded({ (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    })
            ) }
}
/*
// without enum implmentation
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
   */


#Preview {
    Gesture()
}
