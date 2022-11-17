//
//  ContentView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 08/11/2022.
//

import SwiftUI

struct ContentView: View {
 
    @StateObject private var internetMonitor = InternetMonitor()
    
    var body: some View {
        
        Text(internetMonitor.isAvailable ? "Connected" : "Not Connected")
        
            .bold()
            .foregroundColor(internetMonitor.isAvailable ? .green : .red)
  
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
