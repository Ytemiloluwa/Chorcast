//
//  CircularProgressView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 23/12/2022.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: CGFloat
    var total: CGFloat = 100
    var width: CGFloat = 10
    
    var body: some View {
        
     ProgressView(value: progress, total: total)
            .progressViewStyle(CircularProgressViewStyle(width: width))
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            CircularProgressView(progress: 40)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            CircularProgressView(progress: 40)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
