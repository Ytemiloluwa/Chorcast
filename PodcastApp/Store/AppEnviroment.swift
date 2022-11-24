//
//  AppEnviroment.swift
//  PodcastApp
//
//  Created by Temiloluwa on 24/11/2022.
//

import Foundation

struct AppEnviroment {
    
    let decoder: JSONDecoder
    let api: ApiServiceProtocol
    
    init(decoder: JSONDecoder = .init(), api: ApiServiceProtocol = APIService()) {
        
        self.api = api
        self.decoder = decoder
    }
    
}
