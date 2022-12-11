//
//  RenameImage.swift
//  PodcastApp
//
//  Created by Temiloluwa on 11/12/2022.
//

import SwiftUI

struct RemoteImage<Loading: View, Failure: View>: View {
    
    @StateObject private var downloader: ImageDownloader
    private let loading: (() -> Loading)
    private let failure: (() -> Failure)
    
    init(url: String, @ViewBuilder loading: @escaping (() -> Loading), @ViewBuilder failure: @escaping (() -> Failure)) {
        
        _downloader = StateObject(wrappedValue: ImageDownloader(url: url))
        self.loading = loading
        self.failure = failure
    }
    var body: some View {
        
        switch downloader.state {
            
        case.loading:
            
            loading()
            
                .onAppear(perform: {
                    
                    downloader.download()
                })
            
        case.success(let data):
           // Text("\(data.count) bytes")
            
            createImage(data: data)
                .resizable()
            
        case.failure:
            failure()
        }
    }
    
    private func createImage(data: Data) -> Image {
        
        if let uiImage = UIImage(data: data) {
            
            return Image(uiImage: uiImage)
        }
        
        return Image(systemName: "rectangle.fill")
    }
}
struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        
        List {
            
            ForEach(0..<30) { index in
                
                RemoteImage(url: "https://picsum.photos/id/\(index)/200/300", loading: {
                    
                    Text("Loading")
                }, failure: {
                    
                    Text("Failed to download Images")
                })
            }
        }
       
    }
}
