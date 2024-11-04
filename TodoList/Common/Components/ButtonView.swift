//
//  ButtonView.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import SwiftUI

struct ButtonView: View {
    let label: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(label)
                .fontWeight(.semibold)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(background)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    ButtonView(
        label: "Button",
        background: .accentColor,
        action: {}
    )
}
