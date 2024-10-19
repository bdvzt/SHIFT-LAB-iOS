//
//  MainView.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 14.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var userViewModel = UserViewModel()
    @State private var showModal = false
    
    var body: some View {
        VStack {
            Button(action: {
                showModal.toggle()
            }) {
                Text("Приветствие")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .sheet(isPresented: $showModal) {
            WelcomeModal(userViewModel: userViewModel)
        }
        .onAppear {
        }
    }
}

struct WelcomeModal: View {
    @ObservedObject var userViewModel: UserViewModel
    var name: String? {
        userViewModel.showName()
    }

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Приветствие")
                .font(.title)
                .bold()
            
            Text("Добро пожаловать, \(String(describing: name))!")
                .font(.headline)
        }
        .padding()
    }
}


#Preview {
    MainView()
}
