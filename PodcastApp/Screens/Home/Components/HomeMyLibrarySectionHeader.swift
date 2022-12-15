//
//  HomeMyLibrarySectionHeader.swift
//  PodcastApp
//
//  Created by Temiloluwa on 14/12/2022.
//

import SwiftUI

struct HomeMyLibrarySectionHeader: View {
    
    @Binding var seleted: String
    var body: some View {
        
        HStack {
            MyLibraryGenreList(selected: $seleted)
            
            SeeAllLink(destination: {
                
                Text("My Library")
                
            }).padding()
        }.padding(.vertical, 10)
        .background(Color.backgroundColor)
    }
}

struct HomeMyLibrarySectionHeader_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static var previews: some View {
        Group {
            
            HomeMyLibrarySectionHeader(seleted: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            HomeMyLibrarySectionHeader(seleted: .constant(""))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }.environmentObject(store)
    }
}
