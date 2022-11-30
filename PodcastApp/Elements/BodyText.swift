//
//  BodyText.swift
//  PodcastApp
//
//  Created by Temiloluwa on 30/11/2022.
//

import SwiftUI

struct BodyText: View {
    var value: String
    var body: some View {
        Text(value)
            .font(.body)
            .foregroundColor(.body)
    }
}
struct BodyText_Previews: PreviewProvider {
    static var previews: some View {
        BodyText(value: "Hello World")
    }
}
