//
//  ContentView.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                Tab("Home", systemImage: "house") {
                    TodoListView(userId: viewModel.currentUserId)
                }
                
                Tab("Profile", systemImage: "person.circle") {
                    ProfileView()
                }
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
