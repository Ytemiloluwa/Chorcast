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
    
    // hold on to AnyCancellable object returned by the publisher used to fetch image
    private var subsription: AnyCancellable?
    
    // queue to perform the request
    private let queue = DispatchQueue(label: "Temi.PodcastApp.ImageDownloader")
    
    private let StringUrl: String
    
    init(url: String) {
        
        self.StringUrl = url
    }
    
    func download() {
        
       if  let data = ImageCache.shared.get(for: StringUrl) {
            
            self.state = .success(data)
            
            return
        }
        
        guard let url = URL(string: StringUrl) else {
            
            self.state = .failure
            
            return
        
        }
        self.subsription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: self.queue)
            .retry(3)
            .map { $0.data }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] status in
                if case.failure(let error) = status {
                    self?.state = .failure
                    Log.error(error)
                }
            
            }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                ImageCache.shared.set(data, for: self.StringUrl)
            })
        
    }
    
    deinit {
        
        subsription?.cancel()
    }
}
