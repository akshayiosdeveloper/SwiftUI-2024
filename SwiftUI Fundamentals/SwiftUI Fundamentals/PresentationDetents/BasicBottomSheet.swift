//
//  BasicBottomSheet.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 05/08/24.
//

import SwiftUI

struct BasicBottomSheet: View {
    @State private var showSheet = false
    var body: some View {
        VStack {
            Button("Show Bottom Sheet") {
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showSheet, content: {
                Text("This is the expandable bottom sheet.")
                    .presentationDetents([.medium,.large])
            })
        }
    }
}

#Preview {
    BasicBottomSheet()
}
