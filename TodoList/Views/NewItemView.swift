//
//  NewItemView.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var isNewItemPresent: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 16)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                ButtonView(label: "Save", background: .blue) {
                    if viewModel.canSave {
                        viewModel.save()
                        isNewItemPresent = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text(
                        "Error"
                    ),
                    message: Text("Please fill in all fiels and select due date that is today or newer.")
                )
            }
        }
    }
}

#Preview {
    NewItemView(isNewItemPresent: Binding(get: {
        return true
    }, set: { _ in }))
}
