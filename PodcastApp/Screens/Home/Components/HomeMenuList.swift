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
                
                ForEach(MenuItem.all) { menu in
                    
                    Button(action: {}) {
                        MenuLink(menu: menu, destination: {
                            
                            Text("Hello World")
                        })
                    }
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
