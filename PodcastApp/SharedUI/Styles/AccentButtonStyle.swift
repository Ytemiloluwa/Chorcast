//
//  AccentButtonStyle.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/11/2022.
//

import SwiftUI

struct AccentButtonStyle: ButtonStyle {
    
    var verticalPadding: CGFloat
    var isActive = false

    func makeBody(configuration: Self.Configuration) -> some View {
    
        let horizontalPadding = verticalPadding * 2
       
        return configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundColor(isActive ? Color.backgroundColor : .gray)
            .background(isActive ? Color.accentColor : Color.overlay)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        
    }
}
