//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import Foundation
import FirebaseFirestore

@Observable
class TodoListViewModel {
    var isPresentNewItem = false
    var todoList: [ToDoListItem] = []
    
    
    func getTodoList(userId: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("users/\(userId)/todos")
      
        docRef.addSnapshotListener({ QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            self.todoList = documents.compactMap({ queryDocumentSnapshot -> ToDoListItem? in
                return try? queryDocumentSnapshot.data(as: ToDoListItem.self)
            })
        })
     }
    
    func delete(id: String) {
        
    }
}
