//
//  PodcastDetailsScreen.swift
//  PodcastApp
//
//  Created by Temiloluwa on 18/12/2022.
//

import SwiftUI

struct PodcastDetailsScreen: View {
    
    var podcast: PodcastViewModel
    @EnvironmentObject private var store: Store
    @State private var state: AppState.Result<PodcastViewModel> = .loading
    
    var body: some View {
        ZStack {
            switch state {
                
            case.loading:
                ProgressView("Loading...")
            case.success(let podcast):
                PodcastDetailContent(podcast: podcast)
            case.failure:
                FailureView(message: "Unable to fetchPodcast", retryAction: checkState)
            }
        }.onAppear {
            
            checkState()
        }.onChange(of: store.apiState.podcast) { _ in
            
            checkState()
        }.onChange(of: store.coreDataState.savedPodcast) { _ in
            
            checkState()
        }
    }
    
    private func checkState() {
        
        if case.success(let podcast) = store.apiState.podcast, podcast.title == self.podcast.title {
            
          //  state = store.apiState.podcast
            checkCoreDataState(for: podcast)
            
        } else {
            
            store.dispatch(.api(.updatePodcasts(podcast)))
            Log.info("Dispathcing update podcast")
        }
    }
    
    private func checkCoreDataState(for podcast : PodcastViewModel) {
        
        switch store.coreDataState.savedPodcast {
            
        case.loading:
            store.dispatch(.coreData(.fetchPodcasts(podcast)))
        case .success(_):
            break
        case.failure:
            state = store.apiState.podcast
        }
    }
}

struct PodcastDetailsScreen_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    static var previews: some View {
        Group {
            PodcastDetailsScreen(podcast: PodcastViewModel.placeHolder)
                .preferredColorScheme(.dark)
            
            PodcastDetailsScreen(podcast: PodcastViewModel.placeHolder)
            
        }.environmentObject(store)
    }
}
