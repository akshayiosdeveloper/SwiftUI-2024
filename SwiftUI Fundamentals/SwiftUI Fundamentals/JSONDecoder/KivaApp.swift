//
//  KivaApp.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 12/09/24.
//

import SwiftUI

struct KivaApp: View {
    @State private var filterEnabled = false
    @State private var maximumLoanAmount = 500.00
    @ObservedObject var loanStore = LoanStore()
    var body: some View {
        NavigationStack {
            if filterEnabled {
                LoanFilterView(amount: $maximumLoanAmount)
                    .transition(.opacity)
            }
            List(loanStore.loans) { loan in
                LoanCellView(loan: loan)
                .padding(.vertical, 5)
            }
            .navigationTitle("Kiva Loan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.linear) {
                            self.filterEnabled.toggle()
            self.loanStore.filterLoans(maxAmount: Int(self.maximumLoanAmount)) }
                    } label: {
                        Text("Filter")
            } }
            }
            .font(.subheadline)
            .foregroundColor(.primary)
        }
        .task {
            self.loanStore.fetchLatestLoans()
        }
    }
}

#Preview {
    KivaApp()
}
