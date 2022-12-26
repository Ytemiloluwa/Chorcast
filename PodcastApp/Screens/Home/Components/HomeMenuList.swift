//
//  HomeMenuList.swift
//  PodcastApp
//
//  Created by Temiloluwa on 06/12/2022.
//

import SwiftUI

struct HomeMenuList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack(spacing: 15) {
                
                ForEach(MenuItem.all.dropFirst()) { menu in
                    
                    MenuLink(menu: menu, destination: {
                        
                        menu.screen
                    })
                }
            }
        }.padding(.horizontal)
    }
}

struct HomeMenuList_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeMenuList()
            .frame(height: 100)
    }
}
