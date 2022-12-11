//
//  GenreView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 06/12/2022.
//

import SwiftUI

struct GenreView: View {
    var genre: GenreViewModel
    var body: some View {
        HStack {
            
            Text(genre.name)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15, height: 15)
        }.padding(.horizontal)
            .foregroundColor(Color.body)
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(genre: GenreViewModel.placeHolder)
            .previewLayout(.sizeThatFits)
    }
}
