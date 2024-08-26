//
//  WalletApp.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/08/24.
//

import SwiftUI

struct WalletApp: View {
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
            }
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
        
      return  CGSize(width: 0, height: CGFloat(cardIndex) * -50)
    }
    
}

#Preview {
    WalletApp()
}
