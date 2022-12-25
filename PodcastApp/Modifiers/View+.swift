//
//  View+.swift
//  PodcastApp
//
//  Created by Temiloluwa on 13/12/2022.
//

import Foundation
import SwiftUI


extension View {
    
    func roundedBorder(radius: CGFloat, color: Color) -> some View {
        
        self.overlay(RoundedRectangle(cornerRadius: radius).stroke(color, style: StrokeStyle(lineWidth: 0.5)))
    }
}
