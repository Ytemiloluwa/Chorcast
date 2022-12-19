//
//  PodcastDetailsElement.swift
//  PodcastApp
//
//  Created by Temiloluwa on 19/12/2022.
//

import SwiftUI

struct PodcastDetailsElement: View {
    var name: String
    var value: String
    var body: some View {
        
        HStack(alignment: .top){
            
            Text(name + " : ")
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(value.isEmpty ? "Unknown": value)
                .bold()
        }
    }
}

struct PodcastDetailsElement_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          
            PodcastDetailsElement(name: "Author", value: "Temi")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            
            PodcastDetailsElement(name: "Author", value: "Temi")
                .previewLayout(.sizeThatFits)
            
            
        }
    }
}
