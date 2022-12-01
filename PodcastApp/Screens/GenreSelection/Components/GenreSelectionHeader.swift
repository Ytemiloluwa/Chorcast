//
//  GenreSelectionHeader.swift
//  PodcastApp
//
//  Created by Temiloluwa on 01/12/2022.
//

import SwiftUI

struct GenreSelectionHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Genres")
                .font(.largeTitle)
                .bold()
            
            BodyText(value: "To get started please choose at least 3 categories that interest you so that we provide you with what like from the start. Go ahead!")
            
        }.padding()
    }
}

struct GenreSelectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionHeader()
            .previewLayout(.sizeThatFits)
    }
}
