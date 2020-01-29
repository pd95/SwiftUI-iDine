//
//  UserData.swift
//  iDine
//
//  Created by Philipp on 29.01.20.
//  Copyright © 2020 Philipp. All rights reserved.
//

import Combine

class UserData: ObservableObject {
    
    // FIXME: Is this modelling ok?
    @Published var favorites = [MenuItem.ID]()

    var favoriteItems : [MenuItem] {
        favorites.map { uuid -> MenuItem in
            let menuItem : MenuItem = Menu.default.reduce([], { arr, sect in
                if let item = sect.items.first(where: { $0.id == uuid }) {
                    return [item]
                }
                return arr
            }).first!
            return menuItem
        }
    }
    
    func toggleFavorite(_ item: MenuItem) {
        if let index = favorites.firstIndex(of: item.id) {
            favorites.remove(at: index)
        }
        else {
            favorites.append(item.id)
        }
    }
    
    func isFavorite(_ item: MenuItem) -> Bool {
        favorites.contains(item.id)
    }
}
