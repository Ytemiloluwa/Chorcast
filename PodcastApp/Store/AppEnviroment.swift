//
//  AppEnviroment.swift
//  PodcastApp
//
//  Created by Temiloluwa on 24/11/2022.
//

import Foundation

struct AppEnvironment {
    
    let decoder: JSONDecoder
    let api: ApiServiceProtocol
    let coredata: CoreDataserviceProtocol
    let rss: RssServiceProtocol
    
    init(decoder: JSONDecoder = .init(), api: ApiServiceProtocol = APIService(), coredata: CoreDataserviceProtocol = CoreDataService(), rss: RssServiceProtocol = RssService()) {
        
        self.api = api
        self.decoder = decoder
        self.coredata = coredata
        self.rss = rss
    }
    
}
