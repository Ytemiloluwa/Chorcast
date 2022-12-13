//
//  SCImage.swift
//  PodcastApp
//
//  Created by Temiloluwa on 12/12/2022.
//

import SwiftUI

struct SCImage: View {
    var podcast: PodcastViewModel
    var size: CGFloat = .zero
    var cornerRadius: CGFloat = 10
    
    var placeholder: some View {
        
        Image(systemName: "squareshape.fill")
            .resizable()
    }
    
    var failure : some View {
        
        Image(systemName: "xmark")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .foregroundColor(Color.pop)
    }
    
    var remoteImage : some View {
        
        RemoteImage(url: podcast.imageUrl, loading: {
            
            placeholder.redacted(reason: .placeholder)
        }, failure: {
            
            ZStack {
                
                failure
                placeholder.redacted(reason: .placeholder)
            }
            
        })
    }
    
    var content: some View {
        
        Group {
            
            if let uiImage = UIImage(data: podcast.image){
                
                Image(uiImage: uiImage)
            }else {
                
                remoteImage
            }
        }
    }
    var body: some View {
        
      content
            .frame(width: size, height: size, alignment: .center)
            .cornerRadius(cornerRadius)
            .roundedBorder(radius: cornerRadius, color: Color.border)
     
    }
    
}
struct SCImage_Previews: PreviewProvider {
    static var previews: some View {
        SCImage(podcast: PodcastViewModel.placeHolder)
    }
}
