//
//  Log.swift
//  PodcastApp
//
//  Created by Temiloluwa on 21/11/2022.
//

import Foundation
import SwiftUI

extension Date {

    func toString() -> String {
        
        return Log.dateFormatter.string(from: self as Date )

    }
}


struct Log {
    
    
    static private var dateFormat = "yyyy-MM-dd hh:mm"
    
    static var dateFormatter: DateFormatter {
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    
    }
    
    private init() {}
    
}
