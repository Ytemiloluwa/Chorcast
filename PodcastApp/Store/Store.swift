//
//  Store.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/11/2022.
//

import Foundation
import Combine

class Store: ObservableObject {
    // notify views that will use it whenever it changes
    @Published private(set) var apiState = AppState.Api()
    
    private var subscription = Set<AnyCancellable>()
    
    private let enviroment: AppEnviroment
    
    init(enviroment: AppEnviroment = AppEnviroment()) {
        
        self.enviroment = enviroment
    }
    
    func dispatch(_ action: Action) {
        
        switch action {
            
        case.api(let action):
            // calling appropriate reducer based on the action emmited by views
            ApiReducer.execute(action: action, state: apiState, enviroment: enviroment) { [weak self] state in
                
                self?.apiState = state
            }.store(in: &subscription)
        }
    }
    
}
 
