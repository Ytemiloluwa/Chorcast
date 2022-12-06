//
//  MenuLink.swift
//  PodcastApp
//
//  Created by Temiloluwa on 06/12/2022.
//

import SwiftUI

struct MenuLink<Destination: View>: View {
    
    var menu: MenuItem
    var destination: Destination
    
    init(menu: MenuItem, @ViewBuilder destination:(() -> Destination)) {
        
        self.menu = menu
        self.destination = destination()
    }
    var body: some View {
        
        NavigationLink(destination: destination) {
            
            Label(menu.name, systemImage: menu.icon)
                .fixedSize()
                .padding(.horizontal)
                .padding(.vertical, 10)
                .foregroundColor(.accentColor)
                .background(Color.accentColor.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

struct MenuLink_Previews: PreviewProvider {
    static var previews: some View {
        MenuLink(menu: MenuItem.placeholder, destination: {
            
            Text("Hello World")
        })
    }
}
