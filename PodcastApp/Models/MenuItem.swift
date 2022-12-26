//
//  MenuItem.swift
//  PodcastApp
//
//  Created by Temiloluwa on 06/12/2022.
//

import Foundation
import SwiftUI


struct MenuItem: Identifiable, Equatable, Hashable {
    
    var id: String { name }
    var name = ""
    var icon = ""
    
    static var placeholder: MenuItem {
        
        MenuItem(name: "Item", icon: "circlebadge.fill")
    }
    static var all: [MenuItem] {
        
        [MenuItem(name: "Home", icon: "house.fill"),
         MenuItem(name: "Search", icon: "magnifyingglass.circle.fill"),
         MenuItem(name: "Downloaded", icon: "square.and.arrow.down.fill"),
         MenuItem(name: "Bookmarked", icon: "bookmark.fill")]
    }
    
    @ViewBuilder

    var screen: some View {
        
        if self.name == "Home" {
            
            HomeScreen()
        }
        if self.name == "Search" {
            
            SearchScreen()
        }
        if self.name == "Downloaded" {
            
            DownloadedScreen()
        }
        
        if self.name == "Bookmarked" {
            
            BookmarkedScreen()
        }
    }
}


