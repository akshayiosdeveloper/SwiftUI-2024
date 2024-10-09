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
                    // Transaction type
                    TransactionHeader(listType: $listType)
                        .padding(.bottom)
                    // List the transaction records
                    ForEach(paymentDataForView) { transaction in
                        TransactionCellView(transaction: transaction)
                            .onTapGesture {
                                self.showPaymentDetails = true
                                self.selectedPaymentActivity = transaction
                            }
                            .contextMenu {
                                Button(action: {
                                    // Edit payment details
                                    self.editPaymentDetails = true
                                    self.selectedPaymentActivity = transaction
                                    
                                }) {
                                    HStack {
                                        Text("Edit")
                                        Image(systemName: "pencil")
                                    }
                                }
                                
                                Button(action: {
                                    // Delete the selected payment
                                    self.delete(payment: transaction)
                                }) {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                }
                            }
                            
                    }
                    .sheet(isPresented: $showPaymentDetails) {
                        PaymentFormView(payment: self.selectedPaymentActivity!).presentationDetents([.medium, .large])
                    }
                }
                
            }
            .padding(.horizontal)
        }
        
    }
    
    private func delete(payment: PaymentActivity) {
        self.viewContext.delete(payment)
        
        do {
            try self.viewContext.save()
        } catch {
            print("Failed to save the context: \(error.localizedDescription)")
        }
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
    
    struct TransactionHeader: View {
        @Binding var listType: TransactionDisplayType
        
        var body: some View {
            VStack {
                HStack {
                    Text("Recent transactions")
                        .font(.headline)
                        .foregroundColor(Color("Heading"))
                    Spacer()
                }
                .padding(.bottom, 5)
                
                HStack {
                    Group {
                        Text("All")
                            .padding(3)
                            .padding(.horizontal, 10)
                            .background(listType == .all ? Color("PrimaryButton") : Color("SecondaryButton"))
                            .onTapGesture {
                                self.listType = .all
                            }
                        
                        Text("Income")
                            .padding(3)
                            .padding(.horizontal, 10)
                            .background(listType == .income ? Color("PrimaryButton") : Color("SecondaryButton"))
                            .onTapGesture {
                                self.listType = .income
                            }
                        
                        Text("Expense")
                            .padding(3)
                            .padding(.horizontal, 10)
                            .background(listType == .expense ? Color("PrimaryButton") : Color("SecondaryButton"))
                            .onTapGesture {
                                self.listType = .expense
                            }
                    }
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    
                    Spacer()
                }
            }
        }
    }

struct TransactionCellView: View {
    
    @ObservedObject var transaction: PaymentActivity

    var body: some View {
        
        HStack(spacing: 20) {
            
            if transaction.isFault {
                EmptyView()
           
            }  else {
            
                Image(systemName: transaction.type == .income ? "arrowtriangle.up.circle.fill" : "arrowtriangle.down.circle.fill")
                    .font(.title)
                    .foregroundColor(Color(transaction.type == .income ? "IncomeCard" : "ExpenseCard"))
                
                VStack(alignment: .leading) {
                    Text(transaction.name)
                        .font(.system(.body, design: .rounded))
                    Text(transaction.date.string())
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.gray)
                }
        
                Spacer()
                
                Text((transaction.type == .income ? "+" : "-") + NumberFormatter.currency(from: transaction.amount))
                    .font(.system(.headline, design: .rounded))
            }
        }
        .padding(.vertical, 5)
        
    }
}


//#Preview {
//    DashboardView()
//}
