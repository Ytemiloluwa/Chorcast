//
//  AppState.swift
//  PodcastApp
//
//  Created by Temiloluwa on 23/11/2022.
//

import Foundation
import SwiftUI

enum AppState {
    
    enum Result<T: Equatable>: Equatable {
        
        static func ==(lhs: AppState.Result<T>, rhs: AppState.Result<T>) -> Bool {
            
            switch lhs {
                
            case.loading:
                if case loading = rhs {
                    
                    return true
                }
            case.success(let lhsValue):
                if case success(let rhsValue) = rhs {
                    
                    return rhsValue == lhsValue
                }
                
            case.failure:
                if case failure = rhs {
                    
                    return true
                }
                
            }
            
            return false
        }
        case loading
        case success(T)
        case failure
        
    }
    
    struct Api {
        
        var preferredPodcast: [String: Result<[PodcastViewModel]>] = [:]
       // var allGenres : Result<[GenreViewModel]> = .loading
    }
    
}
