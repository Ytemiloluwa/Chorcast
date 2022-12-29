//
//  Double+.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/12/2022.
//

import Foundation

extension Double {
    
    // Formatting a double value to time format
    
    func asString(style: DateComponentsFormatter.UnitsStyle = .positional) -> String {
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = self >= 3600 ? [.hour, .minute, .second] : [.minute, .second]
        formatter.unitsStyle = style
        formatter.zeroFormattingBehavior = .pad
        
        guard let formattedString = formatter.string(from: self) else { return "" }
        
        return formattedString
    }
    
}
