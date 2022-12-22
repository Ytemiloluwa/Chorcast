//
//  PodcastView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 13/12/2022.
//

import SwiftUI

struct PodcastView: View {
    var podcast: PodcastViewModel
    
    var details: some View {
        
        VStack(alignment: .leading, spacing: 5){
            Text(podcast.title)
                .lineLimit(2)
                .font(.headline)
                .fixedSize(horizontal: true, vertical: false)
                .foregroundColor(Color.text)
    
            
            Text(podcast.author)
                .lineLimit(1)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("\(podcast.totalEpisodes) episodes")
            
        }
    }
    var body: some View {
        
        
        HStack {
            
            SCImage(podcast: podcast, size: 100, cornerRadius: 10)
            details
        }.frame(maxWidth: .infinity, alignment: .leading)
    
    }
}
struct PodcastView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            PodcastView(podcast: PodcastViewModel.placeHolder)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            PodcastView(podcast: PodcastViewModel.placeHolder)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
      
        }
    }
}
