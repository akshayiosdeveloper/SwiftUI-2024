//
//  ToDo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 13/09/24.
//

import SwiftUI

struct ToDo: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var newItem: String = ""
    @State private var newItemPriority: Priority = .normal
    @State private var showNewTask = false
    @State var todoItems:[ToDoItem] = []
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("ToDo List")
                        .font(.system(size: 40, weight: .black, design: .rounded))
                    Spacer()
                    Button(action: {
                        self.showNewTask = true
                    }, label: {
                       Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    })
                }
                .padding()
                //show list view
                List {
                    ForEach(todoItems) { todoItem in
                       // show list view
                    }
                }
                .listStyle(.plain)
            } // end of vstack
            // if there is no data , show empty view
            if todoItems.count == 0 {
                // nodataview()
                NoDataView()
            }
            // Display the "Add new todo" view
            if showNewTask {
                //add view
                BlankView(bgColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showNewTask = false
                    }
                // Add new todo task view
                NewToDoView(isShow: $showNewTask, todoItems: $todoItems, name: "", priority: .normal)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0), value: showNewTask)
                
            }
        }
    }
}

struct NoDataView: View {
    var body: some View {
        Image("welcome")
            .resizable()
            .scaledToFit()
    }
}

struct BlankView: View {
    var bgColor: Color
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity , minHeight: 0 , maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    ToDo()
}
