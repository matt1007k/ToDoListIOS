//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var errorMessage: String = ""
    
    func login() {
        
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        print("email: \(email), password: \(password)")
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        return true
    }
}
