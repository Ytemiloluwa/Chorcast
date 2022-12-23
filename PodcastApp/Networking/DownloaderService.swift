//
//  DownloaderService.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import Foundation
import SwiftUI

class DownloaderService: NSObject, DownloadServiceProtocol {
    
    var progress: ((CGFloat) -> Void) = { _ in }
    
    var didFinish: ((Data?) -> Void) = { _ in }
    
    private var session: URLSession {
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }
    
    func download(from url: URL) {
        
        let task = session.downloadTask(with: url)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
         Log.info("Bytes written: \(totalBytesWritten), Total bytes: \(totalBytesExpectedToWrite)")
        
//        if totalBytesExpectedToWrite < 0 {
//            progress(0)
//            return
//        }
//
//        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
//        progress(percentage)
    }
    
    func cancel() {
        
        session.invalidateAndCancel()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        do {
            
            let data = try Data(contentsOf: location)
            didFinish(data)
        }catch let err {
            
            didFinish(nil)
            Log.error(err)
        }
        
    }
}
