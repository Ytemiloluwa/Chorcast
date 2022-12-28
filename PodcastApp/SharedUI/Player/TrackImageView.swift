//
//  TrackImageView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 28/12/2022.
//

import SwiftUI

struct TrackImageView: View {
    
    var track: Track
    
    var remoteImage: some View {
        
        RemoteImage(url: track.imageUrl, loading: {
            
            Rectangle()
                .foregroundColor(.border)
            
        }, failure: {
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(.accentColor)
                Image("mic")
                    .blendMode(.softLight)
            }
            
        })
    }
    
    var body: some View {
        
        Group {
            
            if let image = track.image, let uiImage = UIImage(data: image) {
                
                Image(uiImage: uiImage)
                    .resizable()
            }else {
                
                remoteImage
            }
        }
    }
}

struct TrackImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            TrackImageView(track: Track.placeholder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            TrackImageView(track: Track.placeholder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
