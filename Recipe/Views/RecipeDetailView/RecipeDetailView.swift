//
//  DetailListView.swift
//
//  Created by Hanitha Dhavileswarapu on 11/16/24.
//

import SwiftUI

struct DetailListView: View {
    let detailRecipe: Recipe
    @State private var showWebView = false
    @Binding var isShowingDetail: Bool
    
    enum Constants {
        static let watchOnYoutube = "Watch on YouTube"
        static let detailRecipe = "Detail Recipe"
    }
    
    var body: some View {
        VStack{
            Spacer()
            RecipeRemoteImage(urlString: detailRecipe.photo_url_large!)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)
                .cornerRadius(10)
            VStack{
                Text(detailRecipe.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("It's an \(detailRecipe.cuisine!) cuisine.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                Button(action: { showWebView.toggle()}) {
                    Text(Constants.watchOnYoutube)
                        .font(.title3)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .sheet(isPresented: $showWebView) {
                            WebView(url: detailRecipe.url!)
                        }
                }
                Spacer()
            }
        }
        .frame(width: 325, height: 525)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .opacity(1)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            DismissButton()
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    DetailListView(detailRecipe: mockData.sampleData, isShowingDetail: .constant(true))
}
