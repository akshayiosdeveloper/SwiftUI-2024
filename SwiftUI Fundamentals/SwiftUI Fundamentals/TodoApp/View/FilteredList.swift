//
//  FilteredList.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 20/09/24.
//

import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) var context
    @Binding var searchText: String
    var fetchRequest: FetchRequest<ToDoMenu>
    var todoItems: FetchedResults<ToDoMenu> {
        fetchRequest.wrappedValue
    }
    
    init(_ searchText: Binding<String>) {
        self._searchText = searchText
        let predicate = searchText.wrappedValue.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "name CONTAINS[c] %@", searchText.wrappedValue)
        print("predicate:\(predicate)")
        print(searchText.wrappedValue)
        self.fetchRequest = FetchRequest(entity: ToDoMenu.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDoMenu.priorityNum, ascending: false) ],predicate: predicate,animation: .default)
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(todoItems) { todoItem in
                    ToDoListRow(todoItem: todoItem)
                }
                .onDelete(perform: deleteTask)
            }
            .listStyle(.plain)
            if todoItems.count == 0 {
                NoDataView()
            }
        }
    }
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = todoItems[index]
            context.delete(itemToDelete)
        }
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
    



//#Preview {
////    FilteredList()
//}
