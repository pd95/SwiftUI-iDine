//
//  ItemDetail.swift
//  iDine
//
//  Created by Philipp on 29.01.20.
//  Copyright © 2020 Philipp. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }
            .padding(10)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(10.0)
            .font(.headline)
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.userData.toggleFavorite(self.item)
            }) {
                if userData.isFavorite(self.item) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                else {
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                }
            }
        )
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static let userData = UserData()

    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(order)
                .environmentObject(userData)
        }
    }
}
