//
//  DashboardView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/09/24.
//

import SwiftUI
import CoreData

enum TransactionDisplayType {
    case all
    case income
    case expense
}

struct DashboardView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(
        entity: PaymentActivity.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \PaymentActivity.date, ascending: false)])
    var paymentActivities: FetchedResults<PaymentActivity>
    
    @State private var showPaymentDetails = false
    @State private var editPaymentDetails = false
    
    @State private var listType: TransactionDisplayType = .all
    @State private var selectedPaymentActivity: PaymentActivity?
    
    private var totalIncome: Double {
        let total = paymentActivities.filter {$0.type == .income} .reduce(0) {
            $0 + $1.amount
        }
        
        return total
    }
    
    private var totalExpense: Double {
        
        let total = paymentActivities
            .filter {
                $0.type == .expense
            }.reduce(0) {
                $0 + $1.amount
            }
        
        return total
    }
    private var totalBalance: Double {
        return totalIncome - totalExpense
    }
    
    private var paymentDataForView: [PaymentActivity] {
        
        switch listType {
        case .all:
            return paymentActivities
                .sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        case .income:
            return paymentActivities
                .filter { $0.type == .income }
                .sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        case .expense:
            return paymentActivities
                .filter { $0.type == .expense }
                .sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                MenuBar() {
                    PaymentFormView().environment(\.managedObjectContext, self.viewContext)
                }
                .listRowInsets(EdgeInsets())
                VStack {
                    TotalBalanceCard(totalBalance: totalBalance)
                        .padding(.vertical)
                    HStack(spacing: 15) {
                        IncomeCard(income: totalIncome)
                        ExpenseCard(expense: totalExpense)
                    }
                    .padding(.bottom)
                }
                
            }
            .padding(.horizontal)
        }
        
    }
    
    struct MenuBar<Content>: View where Content: View {
        @State private var showPaymentForm = false
        
        let modalContent: () -> Content
        
        var body: some View {
            ZStack(alignment: .trailing) {
                HStack(alignment: .center) {
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text(Date.today.string(with: "EEEE, MMM d, yyyy"))
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Personal Finance")
                            .font(.title)
                            .fontWeight(.black)
                    }
                    
                    Spacer()
                }.background(Color.yellow)
                
                Button(action: {
                    self.showPaymentForm = true
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                .sheet(isPresented: self.$showPaymentForm, onDismiss: {
                    self.showPaymentForm = false
                }) {
                    self.modalContent()
                }
            }.background(Color.red)
            
        }
    }
    
    struct TotalBalanceCard: View {
        var totalBalance = 0.0
        
        var body: some View {
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("TotalBalanceCard"))
                    .cornerRadius(15.0)
                
                VStack {
                    Text("Total Balance")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(NumberFormatter.currency(from: totalBalance))
                        .font(.system(size: 80, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.1)
                }
            }
            .frame(height: 200)
            
        }
    }
    
    struct IncomeCard: View {
        var income = 0.0
        
        var body: some View {
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("IncomeCard"))
                    .cornerRadius(15.0)
                
                VStack {
                    Text("Income")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(NumberFormatter.currency(from: income))
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.1)
                }
            }
            .frame(height: 150)
            
        }
    }
    struct ExpenseCard: View {
        var expense = 0.0
        
        var body: some View {
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("ExpenseCard"))
                    .cornerRadius(15.0)
                
                VStack {
                    Text("Expense")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .fixedSize()
                    Text(NumberFormatter.currency(from: expense))
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.1)
                    
                }
            }
            .frame(height: 150)
            
        }
    }
}
//#Preview {
//    DashboardView()
//}
