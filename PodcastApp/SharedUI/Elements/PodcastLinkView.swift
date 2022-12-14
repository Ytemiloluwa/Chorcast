//
//  PodcastLinkView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 14/12/2022.
//

import SwiftUI

struct PodcastLinkView: View {
    
    var podcast: PodcastViewModel
    
    var body: some View {
        
        VStack {
            
            NavigationLink(destination: Text("To be Implemented")){
                
                PodcastView(podcast: podcast)
            }
            
            Divider()
        }
    }
}

struct PodcastLinkView_Previews: PreviewProvider {
    static var previews: some View {
    
        Group {
            
            PodcastLinkView(podcast: PodcastViewModel.placeHolder)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            PodcastLinkView(podcast: PodcastViewModel.placeHolder)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
        }
        
    }
}
