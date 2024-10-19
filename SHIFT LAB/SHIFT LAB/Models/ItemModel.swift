//
//  ItemModel.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 20.10.2024.
//

import Foundation

struct ItemModel: Codable, Identifiable {
  let id: Int
  let title: String
  let price: Double
  let description: String
  let category: String
  let image: String
  let rating: Rating
    struct Rating: Codable {
      let rate: Double
      let count: Int
    }
}


