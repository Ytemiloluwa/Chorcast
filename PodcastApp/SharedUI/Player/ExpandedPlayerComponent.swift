//
//  ExpandedPlayerComponent.swift
//  PodcastApp
//
//  Created by Temiloluwa on 30/12/2022.
//

import SwiftUI

struct ExpandedPlayerComponent: View {
    
    var track: Track
    @Binding var isExpanded: Bool
    @Binding var offsetY: CGFloat
    var threshold: CGFloat = 100
    
    var namespace: Namespace.ID
    
    var body: some View {
        
        VStack(spacing: 40) {
        
            TrackImageView(track: track)
                .cornerRadius(15)
                .matchedGeometryEffect(id: "\(track.title)-image", in: namespace)
                .frame(width: 200, height: 200, alignment: .center)
               
            
            VStack {
                Text(track.title)
                    .font(.callout)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text(track.podcastName)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }.matchedGeometryEffect(id: "\(track.title)-titles", in: namespace)
            
            PlayerProgressView(currentTime: 200, totalTime: 300)
                .frame(maxWidth: 300, alignment: .center)
            
            createButtonRow()
        }.padding(40)
        
            .offset(x: 0, y: self.offsetY)
            .gesture(
            
                DragGesture().onChanged({ value in
                    self.offsetY = value.translation.height > 0 ? value.translation.height / 2 : 0
                    
                    
                }).onEnded({ value  in
                    
                    if value.translation.height > self.threshold {
                        
                        isExpanded = false
                    }
                })
            )
        
    }
    
    private func createButtonRow() -> some View {
        
        HStack(spacing: 50) {
            
            
            PlayerButton(action: {
                
                
            }, icon: "gobackward.15", isBig: true)
            .cornerRadius(4)
            .matchedGeometryEffect(id: "\(track.title)-backward", in: namespace)
            
            
            
            PlayerButton(action: {
                
                
            }, icon: "play.fill", isBig: true)
            .cornerRadius(4)
            .matchedGeometryEffect(id: "\(track.title)-play", in: namespace)
            
            
            PlayerButton(action: {
                
                
            }, icon: "goforward.15", isBig: true)
            .cornerRadius(4)
            .matchedGeometryEffect(id: "\(track.title)-forward", in: namespace)
        }
    }
    
}

struct ExpandedPlayerComponent_Previews: PreviewProvider {
    
    @Namespace private static var animation
    
    static var previews: some View {
        
        Group {
            
            ExpandedPlayerComponent(track: Track.placeholder, isExpanded: .constant(false), offsetY: .constant(0), namespace: animation)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            ExpandedPlayerComponent(track: Track.placeholder, isExpanded: .constant(false), offsetY: .constant(0), namespace: animation)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
