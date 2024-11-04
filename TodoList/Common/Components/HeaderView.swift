//
//  HeaderView.swift
//  TodoList
//
//  Created by Max Meza on 10/26/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(.degrees(angle))
                
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    
            }
            .padding(.top, 30)
            
        }
        .frame(maxWidth: .infinity)
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -40)
        .ignoresSafeArea()
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .pink)
}
