//
//  HomeScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 07/12/2022.
//

import SwiftUI

struct HomeScreen: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var hSizeClass: UserInterfaceSizeClass?
#endif
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 20) {
                
                if hSizeClass == .compact {
                    
                    HomeMenuList()
                    
                }
                HomeGenresContent()
                HomeMyLibrarySection()
                
            }
        }.navigationTitle("Home")
    }
}
struct HomeScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    static var previews: some View {
        
        Group {
            
            HomeScreen()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        
            HomeScreen()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
        }.environmentObject(store)
        
    }
}
