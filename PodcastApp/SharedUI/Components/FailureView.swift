//
//  FailureView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 12/12/2022.
//

import SwiftUI

struct FailureView: View {
    var message = ""
    var showIcon = true
    var retryAction = {}
    
    var messageView: some View {
        
        VStack(spacing: 10){
            
            Text("Oops! Something went wrong")
                .font(.title3)
                .bold()
            BodyText(value: message)
                .frame(width: 300, alignment: .center)
                .multilineTextAlignment(.center)
        }
    }
    
    var retryView: some View {
        
        Button(action: retryAction, label: {
            
            Label("Try again", systemImage: "arrow.counterclockwise")
        }).buttonStyle(AccentButtonStyle(verticalPadding: 15))
    }
    
    var icon : some View {
        
        Image(systemName: "exclamationmark.triangle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180, alignment: .center)
            .foregroundColor(Color.pop)
        
    }
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                createBackgroundOverlay(mask: "EmptyScreenOverlay1")
                    .offset(x: 0, y: -50)
                Spacer()
                createBackgroundOverlay(mask: "EmptyScreenOverlay2")
            }.frame(maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                
                if showIcon {
                    
                    icon
                }
                messageView
                retryView
                
            }
        }
    }
    
    fileprivate func createBackgroundOverlay(mask: String) -> some View {
        
        Rectangle()
            .foregroundColor(Color.overlay)
            .frame(height: 300)
            .mask(Image(mask).resizable().frame(height: 300))
        
    }
}

struct FailureView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            FailureView(message: "Unable to fetch podcasts, please try again later", showIcon: false)
                .previewLayout(.fixed(width: 300, height: 200))
                .preferredColorScheme(.dark)
            FailureView(message: "Unable to fetch podcasts, please try again later", showIcon: true)
                .previewLayout(.sizeThatFits)
            
        }
        
    }
}
