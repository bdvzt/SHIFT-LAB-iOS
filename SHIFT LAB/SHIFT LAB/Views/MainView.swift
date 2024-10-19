//
//  MainView.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 14.10.2024.
//

import SwiftUI

struct MainView: View {
//    @StateObject var userSession = UserSession()
//    @EnvironmentObject var currUser: UserModel
    @StateObject var userViewModel = UserViewModel()
    var body: some View {
        VStack {
            Button(action: greetings){
                Text("Push on me")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 70)
                    .frame(width: 200)
                    .background(Color.pink)
                    .cornerRadius(15)
            }
        }
    }
    
    func greetings(){
        
    }
}

#Preview {
    MainView()
}
