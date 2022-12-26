//
//  MainScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/12/2022.
//

import SwiftUI

struct MainScreen: View {
    
#if os(iOS)
    
    @Environment(\.horizontalSizeClass) private var hSizeClass: UserInterfaceSizeClass?
    
#endif
    
    var body: some View {
        
        NavigationView {
            
            if hSizeClass == .regular {
                
                SideBar()
                HomeScreen()
                
            } else {
                
                HomeScreen()
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static var previews: some View {
        Group {
            
            MainScreen()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            MainScreen()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }.environmentObject(store)
    }
}
