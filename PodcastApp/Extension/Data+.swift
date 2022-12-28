//
//  .Data+swift.swift
//  PodcastApp
//
//  Created by Temiloluwa on 28/12/2022.
//

import Foundation

extension Data {
    
    // Save Downloaded episode audio data to a temporary file in order to play it using its location url
    
    func write(to filename: String) -> URL {
        
        
        var dir = NSURL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        
        let location = dir.appendingPathComponent(filename + ".mp3")
        
        
        if FileManager.default.fileExists(atPath: location!.relativePath) {
            
            return location!
        }
        
        do {
            
            try self.write(to: location!, options: WritingOptions.atomicWrite)
            
        }catch let error {
            
            Log.error(error)
        }
        
        return location!
    }
}
