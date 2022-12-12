//
//  Color+.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/11/2022.
//

import Foundation
import SwiftUI

extension Color {
    
    static let pop = Color("Pop")
    static let backgroundColor = Color("backgroundColor")
    static let overlay = Color("overlay")
    static let text = Color("text")
    static let shadow = Color("shadow")
    #if os(watchOS)
    static let body = Color.white
    #endif
    #if os(iOS)
    static let body = Color(UIColor.secondaryLabel)
    static let border = Color(UIColor.separator)
    #elseif os(macOS)
    static let body = Color(NSColor.secondaryLabelColor)
    static let border = Color(Nscolor.separatorColor)
    #endif
}
