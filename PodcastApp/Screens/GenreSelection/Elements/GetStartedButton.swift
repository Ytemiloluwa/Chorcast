//
//  GetStartedButtion.swift
//  PodcastApp
//
//  Created by Temiloluwa on 30/11/2022.
//

import SwiftUI

struct GetStartedButton: View {
    
    var action = {}
    var body: some View {
        Button(action: action, label: {
            
            Text("Get started")
        }).buttonStyle(AccentButtonStyle(verticalPadding: 15))
    }
}

struct GetStartedButton_Previews: PreviewProvider {
    static var previews: some View {
    
        GetStartedButton()

    }
}
