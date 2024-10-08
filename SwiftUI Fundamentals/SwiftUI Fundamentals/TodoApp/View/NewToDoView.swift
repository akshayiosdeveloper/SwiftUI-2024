//
//  NewToDoView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 16/09/24.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isShow: Bool
  //  @Binding var todoItems: [ToDoItem]
    
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
                        .padding(10)
                        .background(priority == .high ? Color.red : Color(.systemGray4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .high
                        }
                    // normal
                    Text("Normal")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .normal ? Color.orange : Color(.systemGray4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .normal
                        }
                    // Low
                    Text("Low")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .low ? Color.green : Color(.systemGray4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .low
                        }
                }
                .padding(.bottom , 30)
                // Save button for adding the todo item
                Button(action: {
                    
                    if self.name.trimmingCharacters(in: .whitespaces) == "" {
                        return
                    }
                    
                    self.isShow = false
                    self.addTask(name: self.name, priority: self.priority)
                    
                }) {
                    Text("Save")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: isEditing ? -110 : 0)
        }
    }
    private func addTask(name: String, priority: Priority, isComplete: Bool = false) {
        let task = ToDoMenu(context: viewContext)
        task.id = UUID()
        task.name = name
        task.priority = priority
        task.isComplete = isComplete
        
        do  {
            try viewContext.save()
            print("data savved")
        } catch {
            print(error)
        }
        
       // let task = ToDoItem(name: name, priority: priority, isComplete: isComplete)
       // todoItems.append(task)
    }
}

#Preview {
    NewToDoView(isShow: .constant(true), name: "", priority: .normal)
}
