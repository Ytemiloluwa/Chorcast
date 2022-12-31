//
//  BlurView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 31/12/2022.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    
    var effect = UIBlurEffect(style: .regular)
    
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        
        uiView.effect = effect
        
    }
}
