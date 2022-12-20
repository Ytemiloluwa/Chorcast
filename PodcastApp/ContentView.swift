//
//  ContentView.swift
//  PodcastApp
//
//  Created by Temiloluwa on 08/11/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \GenreManagedObject.id, ascending: true)])private var genres: FetchedResults<GenreManagedObject>
    
    var body: some View {
        
        if genres.isEmpty {
            
            GenreSelectionScreen()
        }else {
            
            NavigationView {
                
                HomeScreen().navigationTitle("Home")
            }.onAppear(perform: {
                
                DownloaderService().download(from: URL(string:  "https://elt.oup.com/elt/students/headway/downloads/headway_beginner_students_book_unit_01.zip?cc=gb&selLanguage=en")!)
                
            })
        }

    }
}
struct ContentView_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
                             
    static var previews: some View {
        
        Group {
            
            ContentView()
                .preferredColorScheme(.dark)
            
            ContentView()
            
        }.environmentObject(store)
    }
}
