//
//  ImageLoader.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadImage(fromURLString urlString: String?) {
        guard let urlString else {
            self.image = Image("small")
            return
        }
        RecipeAPIClient.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("small").resizable()
    }
}

struct RecipeRemoteImage: View {
    @StateObject var imageLoader =  ImageLoader()
    let urlString: String?
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.loadImage(fromURLString: urlString)
            }
    }
}

