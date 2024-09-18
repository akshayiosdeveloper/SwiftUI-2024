//
//  ToDoMenu.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 18/09/24.
//

import Foundation
import CoreData

public class ToDoMenu: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var priorityNum: Int32
    @NSManaged public var isComplete: Bool
}

extension ToDoMenu: Identifiable {
    var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        set {
            self.priorityNum = Int32(newValue.rawValue)
        }
    }
}
