//
//  ConfigParser.swift
//  PodcastApp
//
//  Created by Temiloluwa on 17/11/2022.
//

import Foundation

public enum ConfigParser {
    
    enum Keys {
        
        static let baseUrl = "BASE_URL"
    }
    
    private static let infoDictionary: [String: Any] = {
        
        guard let dict = Bundle.main.infoDictionary else { fatalError("Plist file not found ") }
        
        return dict
    }()
    
    static let baseUrl: URL = {
        
        guard let baseUrlString = infoDictionary[Keys.baseUrl] as? String else { fatalError("BASE_URL not available in plist file") }
        
        guard let url = URL(string: baseUrlString) else { fatalError("Invalid BASE_URL") }
        
        return url
    }()
    
}
