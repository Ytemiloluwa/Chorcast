//
//  HomeScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 07/12/2022.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 20) {
                
                HomeMenuList()
                
                HomeGenresContent()
                
            }
        }
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeScreen()
            .environmentObject(Store())
        
    }
}
