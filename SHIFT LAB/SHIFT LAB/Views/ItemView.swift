//
//  ItemView.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 20.10.2024.
//

import SwiftUI

struct ItemView: View {
    let item: ItemModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: item.image)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)

                Text(item.title)
                    .font(.title)
                    .padding()

                Text(String(format: "$%.2f", item.price))
                    .font(.title2)
                    .padding()

                Text(item.description)
                    .font(.body)
                    .padding()

                Text("Category: \(item.category)")
                    .font(.headline)
                    .padding()
                
                    HStack {
                        Text(String(format: "%.1f", item.rating.rate))
                            .font(.headline)
                        Spacer()
                        Text("(\(item.rating.count) reviews)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 5)
                
            }
        }
        .navigationTitle(item.title)
    }
}
