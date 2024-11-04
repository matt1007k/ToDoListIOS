//
//  ToDoListItem.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//
import Foundation

struct ToDoListItem: Codable, Identifiable {
    var id = UUID().uuidString
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
    static var sampleItem: ToDoListItem {
        ToDoListItem(
            title: "Sample Item",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
    }
}
