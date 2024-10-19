//
//  UserViewModel.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 20.10.2024.
//

import Foundation

class UserViewModel: ObservableObject {
  @Published var currentUser: UserModel?

  init() {
    loadUser()
  }

  func createUser(name: String, surname: String, dateOfBirth: Date, password: String) {
    let newUser = UserModel(name: name, surname: surname, dateOfBirth: dateOfBirth, password: password)
    currentUser = newUser
    saveUser(user: newUser)
  }

  func saveUser(user: UserModel) {
    let encoder = JSONEncoder()
    if let encodedUser = try? encoder.encode(user) {
      UserDefaults.standard.set(encodedUser, forKey: "currentUser")
    }
  }

  func loadUser() {
    if let encodedUser = UserDefaults.standard.data(forKey: "currentUser"),
      let decodedUser = try? JSONDecoder().decode(UserModel.self, from: encodedUser) {
      currentUser = decodedUser
    }
  }
}

