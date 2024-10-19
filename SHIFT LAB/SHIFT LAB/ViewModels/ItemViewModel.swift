//
//  ItemViewModel.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 20.10.2024.
//

import Foundation



class ItemViewModel: ObservableObject {
  @Published var items: [ItemModel] = []

  func fetchItems() {
    guard let url = URL(string: "https://fakestoreapi.com/products") else { return }

    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        do {
          let decodedProducts = try JSONDecoder().decode([ItemModel].self, from: data)
          DispatchQueue.main.async {
            self.items = decodedProducts
          }
        } catch {
          print("error fetching items") 
        }
      }
    }.resume()
  }
}


