//
//  PaymentDetailView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 03/10/24.
//

import SwiftUI

struct PaymentDetailView: View {
    
    let payment: PaymentActivity
    
    private let viewModel: PaymentDetailViewModel
    
    init(payment: PaymentActivity) {
        
        self.payment = payment
        self.viewModel = PaymentDetailViewModel(payment: payment)
    }
    
    var body: some View {
        VStack {
            TitleBar1(viewModel: self.viewModel)
                .padding(.top, 10)
            
            Image(self.viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
            
            // Payment details
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(self.viewModel.name)
                        .font(.system(.headline))
                        .fontWeight(.semibold)
                    Text(self.viewModel.date)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Subheadline"))
                    Text(self.viewModel.address)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Subheadline"))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(self.viewModel.amount)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .padding(.trailing)
            }
            
            Divider()
                .padding(.horizontal)
            
            if self.viewModel.memo != "" {
                Group {
                    Text("Memo")
                        .font(.subheadline)
                        .bold()
                        .padding(.bottom, 5)
                    
                    Text(self.viewModel.memo)
                        .font(.subheadline)
                    
                    Divider()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
            }
            
            Spacer()
        }
        
    }
}

//#Preview {
//    PaymentDetailView()
//}
struct TitleBar1: View {
    var viewModel: PaymentDetailViewModel
    
    var body: some View {
        HStack {
            Text("Payment Details")
                .font(.headline)
                .foregroundColor(Color("Heading"))
            
            Image(systemName: viewModel.typeIcon)
                .foregroundColor(Color("ExpenseCard"))
            
            Spacer()
        }
        .padding()
    }
}
