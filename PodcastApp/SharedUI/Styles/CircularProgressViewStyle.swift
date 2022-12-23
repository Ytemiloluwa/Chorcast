//
//  CircularProgressViewStyle.swift
//  PodcastApp
//
//  Created by Temiloluwa on 23/12/2022.
//

import Foundation
import SwiftUI

struct CircularProgressViewStyle: ProgressViewStyle {
    
    var width: CGFloat
    
    public func makeBody(configuration: LinearProgressViewStyle.Configuration) -> some View {
        
        VStack(spacing: 10) {
            
            configuration.label
                .foregroundColor(Color.secondary)
            
            ZStack {
                
                Circle()
                    .stroke(lineWidth: width)
                    .opacity(0.3)
                    .foregroundColor(Color.accentColor.opacity(0.5))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                    .stroke(style: StrokeStyle(lineWidth: width, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.accentColor)
                    .rotationEffect(Angle(degrees: -90))
            }
        }
    }
}
