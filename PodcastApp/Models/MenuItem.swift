//
//  MenuItem.swift
//  PodcastApp
//
//  Created by Temiloluwa on 06/12/2022.
//

import Foundation

struct MenuItem: Identifiable, Equatable {
    
    var id: String { name }
    var name = ""
    var icon = ""
    
    static var placeholder: MenuItem {
        
        MenuItem(name: "Item", icon: "circlebadge.fill")
    }
    static var all: [MenuItem] {
        
        [MenuItem(name: "Profile", icon: "person.crop.circle.fill"), MenuItem(name: "Search", icon: "magnifyingglass.circle.fill"), MenuItem(name: "Downloaded", icon: "square.and.arrow.down.fill"), MenuItem(name: "Bookmarked", icon: "bookmark.fill")]
    }
}
