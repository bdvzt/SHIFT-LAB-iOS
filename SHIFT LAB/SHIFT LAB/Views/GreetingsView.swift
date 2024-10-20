//
//  GreetingsView.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 20.10.2024.
//

import SwiftUI

struct GreetingsView: View {
    @ObservedObject var userViewModel: UserViewModel
    
    var name: String? {
        userViewModel.showName()
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Image("pleaseCat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding()

            Text("Greetings")
                .font(.title)
                .bold()
            
            if let name = userViewModel.showName() {
                        Text("Welcome, \(name)")
                            .font(.headline)
            } else {
                Text("Welcome")
                    .font(.headline)
            }
        }
        .padding()
    }
}
