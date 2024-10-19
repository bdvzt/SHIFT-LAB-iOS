//
//  User.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 19.10.2024.
//

import Foundation

class UserModel: Codable { 
  var name: String
  var surname: String
  var dateOfBirth: Date
  var password: String

  init(name: String, surname: String, dateOfBirth: Date, password: String) {
    self.name = name
    self.surname = surname
    self.dateOfBirth = dateOfBirth
    self.password = password
  }
}
