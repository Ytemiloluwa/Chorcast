//
//  ButtonToggleStyle.swift
//  PodcastApp
//
//  Created by Temiloluwa on 30/11/2022.
//

import SwiftUI

struct ButtonToggleStyle: ToggleStyle {
    
    var cornerradius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.headline)
            .padding()
            .foregroundColor(configuration.isOn ? Color.accentColor : Color.gray)
            .frame(maxWidth: .infinity)
            .background(configuration.isOn ? Color.accentColor.opacity(0.2): Color.overlay)
            .cornerRadius(cornerradius)
            .onTapGesture {
                
                configuration.isOn.toggle()
            }
        
    }
    
}
