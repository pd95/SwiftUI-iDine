//
//  FavoritesView.swift
//  iDine
//
//  Created by Philipp on 29.01.20.
//  Copyright © 2020 Philipp. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {

    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            List {
                ForEach(userData.favoriteItems) { item in
                    ItemRow(item: item)
                }
            }
            .navigationBarTitle("Favorites")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let userData = UserData()

    static var previews: some View {
        FavoritesView()
            .environmentObject(userData)
    }
}
