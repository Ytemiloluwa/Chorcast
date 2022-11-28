//
//  ApiReducer.swift
//  PodcastApp
//
//  Created by Temiloluwa on 24/11/2022.
//

import Foundation
import Combine

struct ApiReducer {
    typealias StateCompletion = ((AppState.Api) -> Void)
    
    static func execute(action: Action.Api, state: AppState.Api, environment: AppEnvironment, completion:  @escaping StateCompletion ) -> AnyCancellable {
        switch action {
        case .fetchPodcasts(let term, let limit):
            let publisher = environment.api.remotePublisher(term: term, limit: limit)
            
            return subscribe(to: publisher, type: PodcastList.self, environment: environment) { result, _ in
                setPreferredPodcasts(state: state, term: term, result: result, completion: completion)
                   }
                   
        case .fetchGenres(let filename):
            let publisher = environment.api.localPublisher(filename: filename)
                    return subscribe(to: publisher, type: GenreList.self, environment: environment) { result, _ in
                        setAllGenres(state: state, result: result, completion: completion)
                    }

        }
    }
    
    private static func subscribe<T: Codable>(to publisher: AnyPublisher<Data, URLError>, type: T.Type, environment: AppEnvironment, completion: @escaping ( T?, Error?) -> Void) -> AnyCancellable {
        
        publisher
            .decode(type: type, decoder: environment.decoder)
            .receive(on: DispatchQueue.main)
            .sink { status in
                if case .failure(let error) = status {
                    Log.error(error)
                    completion(nil, error)
                }
            } receiveValue: { result in
                completion(result, nil)
            }
    }
    
    private static func setPreferredPodcasts( state: AppState.Api, term: String, result: PodcastList?, completion:  @escaping StateCompletion) {
        var copyState = state
        
          if let podcastList = result {
              copyState.preferredPodcasts[term] = .success(podcastList.results
                                                          .map { PodcastViewModel(podcast: $0) }
                                                          .filter { !$0.feedUrl.isEmpty && $0.totalEpisodes > 0 })
          } else {
              copyState.preferredPodcasts[term] = .failure
          }
          
          completion(copyState)
    }

    private static func setAllGenres(state: AppState.Api, result: GenreList?, completion:  @escaping StateCompletion) {
        var copyState = state
        if let genreList = result {
            copyState.allGenres = .success(genreList.genres.map { GenreViewModel($0) })
        } else {
            copyState.allGenres = .failure
        }
        
        completion(copyState)
    }
}
