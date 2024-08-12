//
//  TinderHome.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 08/08/24.
//

import SwiftUI

struct TinderHome: View {
    @GestureState private var dragState = DragState.inactive
    private let dragThreshold: CGFloat = 80.0
    @State private var lastIndex = 1
    @State private var removalTransition = AnyTransition.trailingBottom
    @State var cardViews:[TinderCardView] = {
        var views = [TinderCardView]()
        for index in 0..<2 {
            views.append(TinderCardView(image: trips[index].image, title: trips[index].destination))
        }
        //        for trip in trips {
        //            views.append(TinderCardView(image: trip.image, title: trip.destination))
        //        }
        return views
    }()
    private func isTopCard(cardView: TinderCardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else { return false
        }
        return index == 0
    }
    private func moveCard() {
        cardViews.removeFirst()
        self.lastIndex += 1
        let trip = trips[lastIndex % trips.count]
        let newCardView = TinderCardView(image: trip.image, title: trip.destination)
        cardViews.append(newCardView)
    }
    var body: some View {
        TopBarMenu()
        //TinderCardView(image: trips[0].image, title: trips[0].destination)
        ZStack {
            ForEach(cardViews) { cardView in
                cardView.zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                    .overlay {
                        ZStack {
                            Image(systemName: "x.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 100))
                                .opacity(self.dragState.translation.width < -self.dragThreshold && self
                                    .isTopCard(cardView: cardView) ? 1.0 : 0)
                            Image(systemName: "heart.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 100))
                                .opacity(self.dragState.translation.width > self.dragThreshold && self
                                    .isTopCard(cardView: cardView) ? 1.0 : 0.0)
                        }
                    }
                    .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation .height : 0)
                    .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.95 : 1.0)
                    .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double( self.dragState.translation.width / 10) : 0))
                
                    .animation(.interpolatingSpring(stiffness: 180, damping: 100), value: self.dragState.translation)
                    .transition(self.removalTransition)
                
                    .gesture(LongPressGesture(minimumDuration: 0.01) .sequenced(before: DragGesture()) .updating(self.$dragState, body: { (value, state, transaction) in
                        switch value {
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                        
                        
                    })
                             
                        .onChanged({ (value) in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            if drag.translation.width < -self.dragThreshold {
                                self.removalTransition = .leadingBottom
                            }
                            if drag.translation.width > self.dragThreshold {
                                self.removalTransition = .trailingBottom
                            } })
                            .onEnded({ (value) in
                                guard case .second(true, let drag?) = value else {
                                    return
                                    
                                }
                                if drag.translation.width < -self.dragThreshold ||
                                    drag.translation.width > self.dragThreshold {
                                    
                                    //
                                    self.moveCard()
                                }
                            })
                             
                             
                    )
            }
        }
        Spacer(minLength: 20)
        BottomBarMenu()
            .opacity(dragState.isDragging ? 0.0 : 1.0)
            .animation(.default, value: dragState.isDragging)
    }
    
}
#Preview {
    TinderHome()
}
extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge
                                                                              : .bottom)) )
        
    }
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge:
                                                                                
                    .bottom)) )
    } }

