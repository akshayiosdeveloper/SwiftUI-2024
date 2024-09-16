//
//  ToDoItem.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 13/09/24.
//

import Foundation

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

class ToDoItem: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String = ""
    @Published var priority: Priority = .normal
    @Published var isComplete: Bool = false
    
    init(name: String, priority: Priority = .normal, isComplete: Bool = false) {
        self.name = name
        self.priority = priority
        self.isComplete = isComplete
    }
}

