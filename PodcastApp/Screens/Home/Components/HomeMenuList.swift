//
//  HomeMenuList.swift
//  PodcastApp
//
//  Created by Temiloluwa on 06/12/2022.
//

import SwiftUI

struct HomeMenuList: View {
    var body: some View {
        ScrollView {
            
            HStack(spacing: 15) {
                
                ForEach(MenuItem.all) { menu in
                    
                    Button(action: {}) {
                        MenuLink(menu: menu, destination: {
                            
                            Text("Hello World")
                        })
                    }
                }
            }
        }
    }
}

struct HomeMenuList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeMenuList()
                .frame(height: 100)
                .previewLayout(.sizeThatFits)
            
            HomeMenuList()
                .preferredColorScheme(.dark)
                .frame(height: 100)
                .previewLayout(.sizeThatFits)
                
        }
    }
}
