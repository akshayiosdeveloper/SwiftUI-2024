//
//  WalletApp.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/08/24.
//

import SwiftUI

struct WalletApp: View {
    @State private var isCardPresented = false
    @State var isCardPressed = false
    @State var selectedCard: Card?
    @GestureState private var dragState = DragState1.inactive
    
    
    var cards: [Card] = testCards
    private static let cardOffset: CGFloat = 50.0
    var body: some View {
        
        TopNavBar()
            .padding(.bottom)
        Spacer()
        ZStack {
            ForEach(cards) { card in
                CardLayout(card: card)
                    .padding(.horizontal,35)
                    .offset(self.offset(for: card))
                    .zIndex(self.zIndex(for: card))
                    .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                // .animation(self.transitionAnimation(for: card), value: isCardPresented)
                    .gesture(
                        TapGesture()
                            .onEnded({ _ in
                                withAnimation(.easeOut(duration: 0.15).delay(0.1)) {
                                    self.isCardPressed.toggle()
                                    self.selectedCard = self.isCardPressed ? card : nil
                                }
                            })
                            .exclusively(before: LongPressGesture(minimumDuration: 0.05) .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                                    switch value {
                                    case .first(true):
                                        state = .pressing(index: self.index(for: card))
                                    case .second(true, let drag):
                                        state = .dragging(index: self.index(for: card), translation: drag? .translation ?? .zero)
                                    default:
                                        break
                                    } })
                                    .onEnded({ (value) in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        // Rearrange the cards
                                    })
                            ) )
            }
        }
        .onAppear {
            isCardPresented.toggle()
        }
        Spacer()
    }
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: {$0.id == card.id }) else { return nil }
        print("---index---\(index)")
        return index
    }
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else { return 0.0
        }
        print("cardIndex:\(-Double(cardIndex))")
        return -Double(cardIndex)
        
    }
    private func offset(for card: Card) -> CGSize {
        guard let cardIndex = index(for: card) else { return CGSize() }
        
        if isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedCardIndex = index(for: selectedCard) else {
                return .zero
            }
            if cardIndex >= selectedCardIndex {
                return .zero
            }
            let offset = CGSize(width: 0, height: 1400)
            return offset
        }
        return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
    }
    
//    private func transitionAnimation(for card: Card) -> Animation? {
//        var delay = 0.0
//        if let index = index(for: card) {
//            delay = Double(cards.count - index) * 0.1
//        }
//        //        return Animation.sprin(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
//        
//    }
}

#Preview {
    WalletApp()
}
enum DragState1 {
    case inactive
    case pressing(index: Int? = nil)
    case dragging(index: Int? = nil, translation: CGSize)
    var index: Int? {
        switch self {
        case .pressing(let index), .dragging(let index, _):
            return index
        case .inactive:
            return nil
} }
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(_, let translation):
            return translation
} }
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
} }
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .inactive, .pressing:
            return false
} }
}
