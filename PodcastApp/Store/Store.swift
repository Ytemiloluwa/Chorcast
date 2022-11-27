//
//  Store.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/11/2022.
//

import Foundation
import Combine

class Store: ObservableObject {
    
    @Published private(set) var apiState = AppState.Api()
    
    private var subscription = Set<AnyCancellable>()
    
    private let enviroment: AppEnviroment
    
    init(enviroment: AppEnviroment = AppEnviroment()) {
        
        self.enviroment = enviroment
    }
    
}
 
