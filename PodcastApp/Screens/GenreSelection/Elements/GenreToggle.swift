//
//  GenreToggle.swift
//  PodcastApp
//
//  Created by Temiloluwa on 30/11/2022.
//

import SwiftUI

struct GenreToggle: View {
    
    var genre: GenreViewModel
    var onToggle: ((Bool) -> Void) = { _ in }
    @State private var isAvtive = false
    
    var body: some View {
        Toggle(isOn: $isAvtive, label: {
            
            Text(genre.name)
        }).toggleStyle(ButtonToggleStyle(cornerradius: 30))
    }
}

struct GenreToggle_Previews: PreviewProvider {
    static var previews: some View {
        GenreToggle(genre: GenreViewModel.placeHolder)
            .previewLayout(.sizeThatFits)
    }
}
