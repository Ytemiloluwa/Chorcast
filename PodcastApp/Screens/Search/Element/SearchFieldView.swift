//
//  SearchFieldView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 26/12/2022.
//

import SwiftUI

struct SearchFieldView: View {
    
    @Binding var searchTerm: String
    @Binding var isSearching: Bool
    
    var body: some View {
        
        HStack {
            
            Button(action: {}, label: {
                
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            })
            
            TextField("Search Podcast", text: $searchTerm)
        }.padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.overlay)
            .cornerRadius(40)
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            SearchFieldView(searchTerm: .constant(""), isSearching: .constant(true))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            SearchFieldView(searchTerm: .constant(""), isSearching: .constant(false))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
