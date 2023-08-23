//
//  CatGalleryView.swift
//  TabbyCat
//
//  Created by Sabrina C. Sales on 21/08/2023.
//

import SwiftUI
import PhotosUI


struct ImageContainer: Identifiable {
    var id = UUID()
    var image: Image
    
}
struct CatGalleryView: View {
    
    
    @State private var layoutChosen = 0
    @State private var photoPicked: PhotosPickerItem?
    @State private var imageContainers: [ImageContainer] = []
    @State private var columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),]
    
    var body: some View {
        NavigationStack {
            Picker("Select flavour", selection: $layoutChosen) {
                Text("Grid").tag(0)
                Text("Rows").tag(1)
            }
            .pickerStyle(.segmented)
            .onChange(of: layoutChosen) { newValue in
                if layoutChosen == 0 {
                    columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),]
                } else {
                    columns = [GridItem(.flexible())]
                }
            }
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(imageContainers) { imageContainer in
                        imageContainer.image.resizable()
                            .scaledToFill()
                            .frame (minWidth: 0, maxWidth: .infinity)
                            .clipped()
                    }
                }
                
            }
            .clipped()
            .navigationTitle("Cat Gallery")
            .toolbar {
                PhotosPicker(selection: $photoPicked) {
                    Image(systemName: "photo.on.rectangle.angled")
                }
            }
        }
        .onChange(of: photoPicked) { newValue in
            Task {
                if let image = try? await photoPicked?.loadTransferable(type: Image.self) {
                    await MainActor.run {
                        self.imageContainers.append(ImageContainer(image: image))
                    }
                }
            }
        }
    }
}


struct CatGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        CatGalleryView()
    }
}
