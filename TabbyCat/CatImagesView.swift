//
//  CatImagesView.swift
//  TabbyCat
//
//  Created by Sabrina C. Sales on 21/08/2023.
//

import SwiftUI
import Subsonic


struct CatImagesView: View {
    
    @State var catURL = "https://cataas.com/cat?"
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: catURL)!) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .onAppear {
                        play(sound: "meow.m4a")
                    }
            } placeholder: {
                ProgressView()
            }
            Spacer()
            
            Button ("New cat, please!") {
                catURL += "1"
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct CatImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CatImagesView()
    }
}
