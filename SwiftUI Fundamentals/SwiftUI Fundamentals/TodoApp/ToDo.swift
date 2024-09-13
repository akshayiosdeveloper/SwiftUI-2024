//
//  ToDo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 13/09/24.
//

import SwiftUI

struct ToDo: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        Text("\(viewContext.description)")
    }
}

#Preview {
    ToDo()
}
