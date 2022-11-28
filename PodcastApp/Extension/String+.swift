//
//  String+.swift
//  PodcastApp
//
//  Created by Temiloluwa on 13/11/2022.
//

import Foundation

extension String {
    
    private func createFormatter() -> DateFormatter {
        
        let formatter = DateFormatter()
        formatter.locale = .autoupdatingCurrent
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter
    }
    
    func formatDate() -> String {
        
        let formatter = createFormatter()
        if let date = formatter.date(from: self) {
            
            return date.format()
        }
        
        return ""

    }
    
    func toDate() -> Date {
        
        let formatter = createFormatter()
        if let date = formatter.date(from: self) {
            
            return date
        }
        
        return Date()
    }
    
}
