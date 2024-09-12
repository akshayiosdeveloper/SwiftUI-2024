//
//  KivaApp.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 12/09/24.
//

import SwiftUI

struct KivaApp: View {
    @ObservedObject var loanStore = LoanStore()
    var body: some View {
        NavigationStack {
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                .padding(.vertical, 5)
            }
            .navigationTitle("Kiva Loan")
        }
        .task {
            self.loanStore.fetchLatestLoans()
        }
    }
}

#Preview {
    KivaApp()
}
