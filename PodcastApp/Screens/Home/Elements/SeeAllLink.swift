//
//  SeeAllLink.swift
//  PodcastApp
//
//  Created by Temiloluwa on 06/12/2022.
//

import SwiftUI

struct SeeAllLink<Destination: View>: View {
    private var destination: Destination
    
    init(@ViewBuilder destination: (() -> Destination)) {
        
        self.destination = destination()
    }
    var body: some View {
        NavigationLink(destination: destination) {
            
            Text("See All")
        }
    }
}

struct SeeAllLink_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllLink(destination: {
            
            Text("See All")
        })
    }
}
