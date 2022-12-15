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
            
            VStack(spacing: 20) {
                
                HomeMenuList()
                HomeGenresContent()
                HomeMyLibrarySection()
                
            }
        }
    }
}
struct HomeScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    static var previews: some View {
        
        Group {
            
            HomeScreen()
               
              
            HomeScreen()
             
        }.environmentObject(store)
        
    }
}
