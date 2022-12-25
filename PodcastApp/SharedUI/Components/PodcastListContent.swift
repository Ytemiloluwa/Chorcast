//
//  PodcastListContent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 14/12/2022.
//

import SwiftUI

struct PodcastListContent: View {
 
    var state: AppState.Result<[PodcastViewModel]> = .loading
    
    var fetchPodcasts: (() -> Void)
    
    @EnvironmentObject private var store: Store
    
    var body: some View {
        
        switch state {
            
        case.loading:
            RedactedListView(viewType: .podcast)
               .onAppear(perform: fetchPodcasts)
                    
        case.success(let podcasts):
            successContent(podcasts: podcasts)
        case .failure:
            FailureView(message:"Unable to fetch podcasts", retryAction: fetchPodcasts)
        }
        
    }
    
    private func successContent(podcasts: [PodcastViewModel]) -> some View {
        
        ForEach(podcasts) { podcasts in
           PodcastLinkView(podcast: podcasts)
            
        }.padding(.horizontal)
    }


}
struct PodcastListContent_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    static var previews: some View {
        
        Group {
            
            VStack {
                
                PodcastListContent(state: .loading, fetchPodcasts: {})
                    .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 350.0, height: 400.0))
            }
            
            VStack {
                
                PodcastListContent(state: .loading, fetchPodcasts: {})
                    .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 350.0, height: 400.0))
            }
        }.environmentObject(store)
        
    }
}
