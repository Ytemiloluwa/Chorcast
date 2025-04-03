//
//  PlayerProgressView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/12/2022.
//

import SwiftUI

struct PlayerProgressView: View {
    
    @Binding var currentTime: Double
    var totalTime: Double
    var onFinishSeeking: ((Double) -> Void) = { _ in }
    
    var body: some View {
        VStack {
            ScrollBar(currentTime: $currentTime, totalTime: totalTime, finish: { value in
                onFinishSeeking(totalTime * value)
            })
            .frame(height: 15, alignment: .center)
            
            HStack {
                Text("\(currentTime.asString(style: .positional))")
                    .font(.caption)
                Spacer()
                Text("\(totalTime.asString(style: .positional))")
                    .font(.caption)
            }
        }
        .frame(height: 40, alignment: .center)
    }
      
}

struct PlayerProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerProgressView(currentTime: .constant(2000), totalTime: 3000)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            PlayerProgressView(currentTime: .constant(2000), totalTime: 3000)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
        }
    }
}
