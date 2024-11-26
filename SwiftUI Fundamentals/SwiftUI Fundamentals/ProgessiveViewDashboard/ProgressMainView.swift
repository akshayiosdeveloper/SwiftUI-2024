//
//  ProgressMainView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 26/11/24.
//

import SwiftUI

struct ProgressMainView: View {
    @State var progress = 0.0
    var body: some View {
        VStack {
            ProgressRingViewDashboard(progress: $progress)
            HStack {
                Group {
                    Text("0%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.0
                        }
                    Text("50%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
                        }
                    Text("100%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray6)) .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous)) .padding()
            }
            .padding() }
    }
}

#Preview {
    ProgressMainView()
}
