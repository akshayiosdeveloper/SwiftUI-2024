//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 28/7/2022.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    @EnvironmentObject var settingStore: SettingStore
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Sort Prep")) {
                    Picker(selection: $selectedOrder) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.text)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    settingStore.showCheckInOnly = self.showCheckInOnly
                       settingStore.displayOrder = self.selectedOrder
                        settingStore.maxPriceLevel = self.maxPriceLevel
                        dismiss()
                    } label: {
                        Text("Save")
                            .foregroundColor(.primary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .onAppear {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckInOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(SettingStore())    }
}
