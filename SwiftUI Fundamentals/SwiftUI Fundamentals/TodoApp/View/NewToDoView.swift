//
//  NewToDoView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 16/09/24.
//

import SwiftUI

struct NewToDoView: View {
    @Binding var isShow: Bool
    @Binding var todoItems: [ToDoItem]
    
    @State var name: String
    @State var priority: Priority
    @State var isEditing = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment:.leading) {
                HStack {
                    Text("Add a new task")
                        .font(.system(.title,design: .rounded))
                        .bold()
                    Spacer()
                    
                    Button(action: {
                        self.isShow = false
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.headline)
                    })
                } // end of hstack
                
                // TextField
                TextField("Enter the task description",text: $name) { (editingChanged) in
                    self.isEditing = editingChanged
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom)
                // Priority
                Text("Priority")
                    .font(.system(.subheadline,design: .rounded))
                    .padding(.bottom)
                // HStack
                HStack {
                    Text("High")
                        .font(.system(.headline, design: .rounded))
                }
                
                
            }
        }
    }
}

#Preview {
    NewToDoView(isShow: .constant(true), todoItems: .constant([]), name: "", priority: .normal)
}
