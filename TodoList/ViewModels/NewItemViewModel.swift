//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate = Date()
    
    @Published var showAlert = false
    
    func save() {
        guard canSave else { return }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        // Create model
        let newItem = ToDoListItem(
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
            
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        // is greather 24hr
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
