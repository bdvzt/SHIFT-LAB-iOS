//
//  ContentView.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 14.10.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var dateOfBirth: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    
    let bg = Color(UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0))

    var body: some View {
        VStack {
            Text("Registration")
                .padding(50)
            
            TextField("Name", text: $name)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            TextField("Surname", text: $surname)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            TextField("Date of birth", text: $dateOfBirth)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            TextField("Password", text: $password)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            TextField("Repeat password", text: $repeatPassword)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}
