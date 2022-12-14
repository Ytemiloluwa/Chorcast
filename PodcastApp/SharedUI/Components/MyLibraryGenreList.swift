//
//  MyLibraryGenreList.swift
//  PodcastApp
//
//  Created by Temiloluwa on 13/12/2022.
//

import SwiftUI

struct MyLibraryGenreList: View {
    
    @Binding var selected: String
    @EnvironmentObject private var store: Store
    @State private var genres: [GenreViewModel] = []
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
             
            ScrollViewReader { reader in
                
                createScrollViewContent(reader: reader)
            }
            
        }).padding(.vertical, 10)
        .background(Color.backgroundColor)
        .onAppear{
            
            store.dispatch(.coreData(.fetchGenres))
            
        }.onChange(of: store.coreDataState.savedGenres) { value in
            
            genres = value
            
            if selected.isEmpty {
                
                selected = value[0].name
            }
        }

    }
    
    fileprivate func createScrollViewContent(reader: ScrollViewProxy) -> some View {
        
        HStack(spacing: 10) {
            
            ForEach(0..<genres.count, id: \.self) { index in
                
               createButton(index, reader: reader)
            }
        }
    }
    
    fileprivate func createButton(_ index : Int, reader: ScrollViewProxy) -> some View {
        
        let isSelected = genres[index].name == selected
        
        return Button {
            
            selected = genres[index].name
            reader.scrollTo(index)
            
        } label: {
            
            Text(genres[index].name)
                .multilineTextAlignment(.leading)
        }.buttonStyle(AccentButtonStyle(verticalPadding: 10, isActive: isSelected))
    }
}

struct MyLibraryGenreList_Previews: PreviewProvider {
    
    static let store = Store(enviroment: AppEnvironment(api: previewApiService(), coredata: PreviewCoreDataService()))
    
    static var previews: some View {
        Group {
            
            MyLibraryGenreList(selected: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            MyLibraryGenreList(selected: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
        }.environmentObject(store)
    }
}
