//
//  AccentButtonStyle.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/11/2022.
//

import SwiftUI

struct AccentButtonStyle: ButtonStyle {
    
    var verticalPadding: CGFloat

    func makeBody(configuration: Self.Configuration) -> some View {
    
        let horizontalPadding = verticalPadding * 2
       
        return configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundColor(Color.gray)
            .background(Color.backgroundColor.opacity(0.3))
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        
    }
}
