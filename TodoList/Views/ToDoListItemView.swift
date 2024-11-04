//
//  ToDoListItemView.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import SwiftUI

struct ToDoListItemView: View {
    var item: ToDoListItem
    @State private var viewModel = TodoListItemViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }

        }
    }
}

#Preview {
    ToDoListItemView(
        item: ToDoListItem.sampleItem
    )
}
