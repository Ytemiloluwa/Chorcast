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
        
        ZStack(alignment: alignment()){
            NavigationView {
                
                if hSizeClass == .regular {
                    
                    SideBar()
                    HomeScreen()
                    
                } else {
                    
                    HomeScreen()
                }
            }
            
            //PlayerView()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func alignment() -> Alignment {
        
        switch hSizeClass {
            
        case.regular:
            return .bottomTrailing
        case.compact:
            return.bottom
        default:
            return.bottom
            
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static let playerManager = PlayerManager()
    static let downloadManager = DownloadManager()
    
    static var previews: some View {
        Group {
            
            MainScreen()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            MainScreen()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }.environmentObject(store)
            .environmentObject(playerManager)
            .environmentObject(downloadManager)
    }
}

