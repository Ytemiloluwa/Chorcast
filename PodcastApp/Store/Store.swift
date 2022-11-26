//
//  Store.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/11/2022.
//

import Foundation

class Store: ObservableObject {
    
    @Published private(set) var apiState = AppState.Api()
    
}
