//
//  SHIFT_LABApp.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 14.10.2024.
//

import SwiftUI

@main
struct SHIFT_LABApp: App {
    @StateObject var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if userViewModel.currUser != nil {
                    MainView()
                } else {
                    RegistrationView()
                }
            }
        }
    }
}
