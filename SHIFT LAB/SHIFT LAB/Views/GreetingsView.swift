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
            Text("Greetings")
                .font(.title)
                .bold()
            
            Text("Welcome, \(String(describing: name))")
                .font(.headline)
        }
        .padding()
    }
}
