//
//  TodoListApp.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import SwiftUI
import FirebaseCore

@main
struct TodoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
