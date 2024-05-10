//
//  SettingView.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 10/05/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack {
            
           Form {
               Section {
                   TextField("First", text: "Akshay")
                   TextField("Last name", text: "Kumar")
               }
               
               Section {
                   TextField("Nickname", text: "a")
               }
           }
        
    }
}

#Preview {
    SettingView()
}
