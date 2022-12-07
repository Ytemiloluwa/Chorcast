//
//  HomeSectionHeaderView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 07/12/2022.
//

import SwiftUI

struct HomeSectionHeaderView: View {
    
    var title: String
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.title2)
                .bold()
            
            Spacer()
            
            SeeAllLink(destination: {
                
                Text("To be implemented")
            }).padding(.vertical, 7)
                .cornerRadius(10)
                .background(Color.clear)
            
        }.padding(.horizontal)
    }
}

struct HomeSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeSectionHeaderView(title: "Trending")
            .previewLayout(.sizeThatFits)
        
    }
}

