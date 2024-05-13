//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 28/7/2022.
//

import SwiftUI

struct SettingView: View {
   
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Sort Prep")) {
                    Text("Display Order")
                }
                Section(header: Text("Filter Prep")) {
                    Text("Filter")
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
