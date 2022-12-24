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
    let coredata: CoreDataServiceProtocol
    let rss: RssServiceProtocol
    let downloader: DownloadServiceProtocol
    
    init(decoder: JSONDecoder = .init(), api: ApiServiceProtocol = APIService(), coredata: CoreDataServiceProtocol = CoreDataService(), rss: RssServiceProtocol = RssService(), downloader: DownloadServiceProtocol = DownloaderService()) {
        
        self.api = api
        self.decoder = decoder
        self.coredata = coredata
        self.rss = rss
        self.downloader = downloader
    }
    
}
