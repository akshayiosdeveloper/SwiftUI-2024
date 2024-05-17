//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 28/7/2022.
//

import SwiftUI

struct SettingView: View {
    private var displayOrders = [ "Alphabetical", "Show Favorite First", "Show Check-i n First"]
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Sort Prep")) {
                    Picker(selection: $selectedOrder) {
                        ForEach(0 ..< displayOrders.count, id: \.self) {
                            Text(self.displayOrders[$0])
                        }
                    } label: {
                       Text("Display order")
                    }

                }
                Section(header: Text("Filter Prep")) {
                    Toggle(isOn: $showCheckInOnly, label: {
                        Text("Show check-in only")
                        Stepper {
                            Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                        } onIncrement: {
                            self.maxPriceLevel += 1
                                    if self.maxPriceLevel > 5 {
                                        self.maxPriceLevel = 5
                                    }
                        } onDecrement: {
                            self.maxPriceLevel -= 1
                                    if self.maxPriceLevel < 1 {
                                        self.maxPriceLevel = 1
                            }
                        } onEditingChanged: { flag in
                            
                        }

                    })
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
