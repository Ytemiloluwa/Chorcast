//
//  ImageDownloader.swift
//  PodcastApp
//
//  Created by Temiloluwa on 09/12/2022.
//

import Foundation
import Combine

class ImageDownloader: ObservableObject {
    
    enum State {
        
        case loading
        case success(Data)
        case failure
    }
    
    // property that will be observed by views in the app
    @Published private(set) var state = State.loading
    
}
