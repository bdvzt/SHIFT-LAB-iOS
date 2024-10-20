//
//  UserViewModel.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 20.10.2024.
//

import Foundation

class UserViewModel: ObservableObject {
  @Published var currUser: UserModel?

  init() {
    loadUser()
  }

  func createUser(name: String, surname: String, dateOfBirth: Date, password: String) {
    let newUser = UserModel(name: name, surname: surname, dateOfBirth: dateOfBirth, password: password)
    currUser = newUser
    saveUser(user: newUser)
  }
    
  func showName() -> String? {
    return currUser?.name
  }
    
  func saveUser(user: UserModel) {
    let encoder = JSONEncoder()
    if let encodedUser = try? encoder.encode(user) {
      UserDefaults.standard.set(encodedUser, forKey: "currUser")
    }
  }

  func loadUser() {
    if let encodedUser = UserDefaults.standard.data(forKey: "currUser"),
      let decodedUser = try? JSONDecoder().decode(UserModel.self, from: encodedUser) {
      currUser = decodedUser
    }
  }
}

