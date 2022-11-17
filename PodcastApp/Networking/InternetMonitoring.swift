//
//  InternetMonitoring.swift
//  PodcastApp
//
//  Created by Temiloluwa on 17/11/2022.
//

import Foundation
import Network

class InternetMonitor: ObservableObject {
    
    private let monitor: NWPathMonitor = NWPathMonitor()
    
    @Published var isAvailable = true
    
    init() {
        
        let queue = DispatchQueue(label: "Temi.PodcastApp.InternetMonitor")
        monitor.pathUpdateHandler = { path in
            
            DispatchQueue.main.async {
                
                self.isAvailable = path.status == .satisfied
            
            }
        }
        
        monitor.start(queue: queue)
    }
}
