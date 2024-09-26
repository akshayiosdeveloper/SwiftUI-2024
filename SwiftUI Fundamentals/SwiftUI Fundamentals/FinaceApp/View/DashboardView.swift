//
//  DashboardView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/09/24.
//

import SwiftUI

struct DashboardView: View {
    @Environment(\.managedObjectContext) var viewContext
    var body: some View {
        Text(self.viewContext.description)
    }
}

#Preview {
    DashboardView()
}
