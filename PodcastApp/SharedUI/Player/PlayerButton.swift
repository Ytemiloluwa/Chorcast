//
//  PlayerButton.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/12/2022.
//

import SwiftUI

struct PlayerButton: View {
    var action = {}
    var icon = ""
    var isBig = false
    
    var body: some View {
        
        let size: CGFloat = isBig ? 30 : 20
        
        return Button(action: action, label: {
            
            Image(systemName: icon)
                .resizable()
                .font(.system(size: size, weight: .light, design: .rounded))
                .scaledToFit()
                .frame(width: size, height: size, alignment: .center)
                .foregroundColor(Color.gray)
            
        })
    }
}

struct PlayerButton_Previews: PreviewProvider {
    
    static var previews: some View {
       
        Group {
            
            PlayerButton()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
          
            PlayerButton()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
