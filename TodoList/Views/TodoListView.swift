//
//  TodoListView.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import SwiftUI

struct TodoListView: View {
    @State private var viewModel = TodoListViewModel()
    private var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.todoList) { item in
                        ToDoListItemView(item: item)
                            .swipeActions {
                                Button(role: .destructive) {
                                    viewModel.delete(id: item.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                        
                                }
                                

                            }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.isPresentNewItem.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: $viewModel.isPresentNewItem) {
            NewItemView(isNewItemPresent: $viewModel.isPresentNewItem)
        }
        .task {
            viewModel.getTodoList(userId: userId)
        }
    }
    
}

#Preview {
    TodoListView(userId: "1")
}
