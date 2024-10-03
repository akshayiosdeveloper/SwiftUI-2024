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

    var body: some View {
        Text(self.viewContext.description)
    }
}

#Preview {
    DashboardView()
}
