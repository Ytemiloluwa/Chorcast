//
//  RedactedListView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 14/12/2022.
//

import SwiftUI

struct RedactedListView: View {
    
    enum ViewType {
        
        case genre
        case podcast
    }
    
    var viewType: ViewType
    
    var body: some View {
        
        switch viewType {
            
        case.podcast:
            ForEach(PodcastViewModel.listPlaceholder) { podcast in
                
                PodcastView(podcast: podcast)
            }.redacted(reason: .placeholder)
                .padding(.horizontal)
            
        case.genre:
            ForEach(GenreViewModel.listPlaceHolder) { genre in
                
                GenreView(genre: genre)
                    .frame(height: 70)
                    .background(Color.overlay)
                    .cornerRadius(15)
            }.redacted(reason: .placeholder)
                .padding(.horizontal)
        }
        
    }
}

struct RedactedListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            VStack {
                
                RedactedListView(viewType: RedactedListView.ViewType.podcast)
                
            }
            .previewLayout(.fixed(width: 350.0, height: 400.0))
            .preferredColorScheme(.dark)
            
            VStack {
                
                RedactedListView(viewType: RedactedListView.ViewType.genre)
                
            }
            .previewLayout(.fixed(width: 350.0, height: 400.0))
            .preferredColorScheme(.light)
            
        }
    }
}
