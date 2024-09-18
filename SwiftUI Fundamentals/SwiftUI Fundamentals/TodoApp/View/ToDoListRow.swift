//
//  ToDoListRow.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 17/09/24.
//

import SwiftUI

struct ToDoListRow: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var todoItem: ToDoMenu
   //
    
    var body: some View {
       
        Toggle(isOn: self.$todoItem.isComplete) {
           
            HStack {
              
                Text(self.todoItem.name)
                    .strikethrough(self.todoItem.isComplete, color: .black)
                    .bold()
                    .animation(.default)
                Spacer()
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(self.color(for: self.todoItem.priority))
                
            }
        }
        .toggleStyle(CheckboxStyle())
        
        .onChange(of: todoItem, perform: { _ in
                
                if self.viewContext.hasChanges {
                    
                    try? self.viewContext.save()
                }
            })
            
    }
    
    private func color(for priority: Priority) -> Color {
        switch priority {
        case .high: return .red
        case .normal: return .orange
        case .low: return .green
        }
    }
}

//#Preview {
//    ToDoListRow(todoItem: <#ToDoItem#>)
//}
