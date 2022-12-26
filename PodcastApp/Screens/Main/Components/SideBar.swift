//
//  SideBar.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/12/2022.
//

import SwiftUI

struct SideBar: View {
    
    @State private var selected = MenuItem.all.first
    
    var body: some View {
        List {
            
            ForEach(MenuItem.all) { item in
                
                NavigationLink(destination: item.screen, tag: item, selection: $selected) {
                    
                    Label(title: { Text(item.name)}, icon: {Image(systemName: item.icon)})
                }
            }
        }.listStyle(SidebarListStyle())
            .navigationTitle("Menu")
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
