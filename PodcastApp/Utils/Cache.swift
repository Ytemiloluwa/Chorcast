//
//  Cache.swift
//  PodcastApp
//
//  Created by Temiloluwa on 08/12/2022.
//

import Foundation

final class Cache<Key: Hashable, Value> {
    
    private let dateprovider: () -> Date
    private let entryLifeTime: TimeInterval
    
    init(dateprovider: @escaping () -> Date = Date.init, entryLifeTime: TimeInterval = 12 * 60 * 60) {
        
        self.dateprovider = dateprovider
        self.entryLifeTime = entryLifeTime
    }
}
