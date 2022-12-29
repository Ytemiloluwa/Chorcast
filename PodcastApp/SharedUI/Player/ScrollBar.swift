//
//  ScrollBar.swift
//  PodcastApp
//
//  Created by Temiloluwa on 29/12/2022.
//

import SwiftUI

struct ScrollBar: View {
    
    @Binding var currentTime: Double
    var totalTime: Double
    var finish: ((Double) -> Void) = { _ in }
    
    @State private var offsetX: CGFloat = 0.0
    @State private var percent: CGFloat = 0.0
    @State private var timeIndicators: CGFloat = 0
    @State private var isChanging: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                    .foregroundColor(Color.accentColor.opacity(0.3))
                    .frame(width: nil, height: geometry.size.height , alignment: .center)
                
                RoundedRectangle(cornerSize: CGSize(width: 3, height: 3))
                    .foregroundColor(Color.accentColor)
                    .frame(width: offsetX, height: geometry.size.height, alignment: .center)
                
            }.gesture(
            
            DragGesture()
                .onChanged({ drag in
                    
                    self.offsetX = min(max(drag.location.x, 0), geometry.size.width)
                    self.percent = self.offsetX / (geometry.size.width)
                }).onEnded({ drag  in
                    
                    self.offsetX = min(max(drag.location.x, 0), geometry.size.width)
                })
            )
        }
    }
}

struct ScrollBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ScrollBar(currentTime: .constant(2000), totalTime: 3000)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 350.0, height: 50))
        
            ScrollBar(currentTime: .constant(2000), totalTime: 3000)
                .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 350.0, height: 50))
        }
    }
}
