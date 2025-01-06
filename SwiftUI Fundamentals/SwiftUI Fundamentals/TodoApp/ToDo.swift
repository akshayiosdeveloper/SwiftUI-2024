//
//  ToDo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 13/09/24.
//

import SwiftUI
import CoreData
struct ToDo: View {
   // @Environment(\.managedObjectContext) private var viewContext
    @State private var newItem: String = ""
    @State private var newItemPriority: Priority = .normal
    @State private var showNewTask = false
    @State private var searchText = ""
   
    //@State var todoItems:[ToDoItem] = []
//    @FetchRequest(entity: ToDoMenu.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoMenu.priorityNum, ascending: false)],predicate: NSPredicate(format: "name CONTAINS[c] %@", "S"))
  //var todoItems: FetchedResults<ToDoMenu>
    
    
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
                // Add search bar
               // SearchBar(text: $searchText)
                   // .padding(.top,-20)
                //show list view
               // List {
                    /*
                     
                     normal function for showing list of todo items
                    ForEach(todoItems) { todoItem in
                       // show list view
                        ToDoListRow(todoItem: todoItem)
                    }
                     */
                    
                    /* showing list using search filter feature is using  todo array*/
                    /*
                    ForEach(todoItems.filter( {searchText.isEmpty ? true : $0.name.contains(searchText)})) { todoItem in
                        ToDoListRow(todoItem: todoItem)
                    }
                    */
                    /* Search using fetch request in coredata */
                    FilteredList($searchText)
                    

//                }
//                .listStyle(.plain)
                

            } // end of vstack
            .rotation3DEffect(Angle(degrees: showNewTask ? 5 : 0), axis: (x: 1, y: 0, z: 0))
            .offset(y: showNewTask ? -50 : 0)
            .animation(.easeOut, value: showNewTask)
            .onAppear {
                UITableView.appearance().separatorColor = .clear
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
                NewToDoView(isShow: $showNewTask, name: "", priority: .normal)
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
