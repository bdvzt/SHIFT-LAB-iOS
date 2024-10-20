//
//  MainView.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 14.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var itemViewModel = ItemViewModel()
    @StateObject var userViewModel = UserViewModel()
    @State private var showModal = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    showModal.toggle()
                }) {
                    Text("Push on me")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(15)
                }
                .padding(.bottom, 30)
                
                List(itemViewModel.items) { item in
                    NavigationLink(destination: ItemView(item: item)) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: item.image)) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 200)
                            
                            Text(item.title)
                                .font(.headline)
                            Text(String(format: "$%.2f", item.price))
                                .font(.subheadline)
                            Text(item.category)
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Items")
            }
            .padding()
            .sheet(isPresented: $showModal) {
                GreetingsView(userViewModel: userViewModel)
            }
            .onAppear {
                itemViewModel.fetchItems()
            }
        }
    }
}


#Preview {
    MainView()
}
