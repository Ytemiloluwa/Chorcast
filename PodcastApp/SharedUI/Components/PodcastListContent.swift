//
//  PodcastListContent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 14/12/2022.
//

import SwiftUI

struct PodcastListContent: View {
    var genre: String
    var limit: Int = 10
    
    @EnvironmentObject private var store: Store
    
    var body: some View {
        
        switch getState(for: genre) {
        case.loading:
            RedactedListView(viewType: .podcast)
               .onAppear(perform: fetchPodcasts)
                    
        case.success(let podcasts):
            successContent(podcasts: podcasts)
        case .failure:
            FailureView(message:"Unable to fetch podcasts for \(Text(genre).bold())", retryAction: fetchPodcasts)
        }
        
    }
    
    private func successContent(podcasts: [PodcastViewModel]) -> some View {
        
        ForEach(podcasts) { podcasts in
           PodcastLinkView(podcast: podcasts)
            
        }.padding(.horizontal)
    }
    
    private func fetchPodcasts() {
        
        store.dispatch(.api(.fetchPodcasts(genre, limit: limit)))
    }
    
    
    private func getState(for term: String) -> AppState.Result<[PodcastViewModel]>{
        
        if let state = store.apiState.preferredPodcasts[term] {
            
            return state
        }
        
        return .loading
    }
}
struct PodcastListContent_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    static var previews: some View {
        
        Group {
            
            VStack {
                
                PodcastListContent(genre: "technology")
                    .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 350.0, height: 400.0))
            }
            
            VStack {
                
                PodcastListContent(genre: "technology")
                    .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 350.0, height: 400.0))
            }
        }.environmentObject(store)
        
    }
}
