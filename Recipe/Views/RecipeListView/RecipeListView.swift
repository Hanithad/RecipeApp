//
//  ContentView.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/7/24.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var viewModel = RecipeViewModel(networkManager: NetworkManager.shared)
    @State private var selectedItem: String?
    @State private var isShowing = false
    //How to show Alert on swiftUI
    //Elegently show progress view
    //Navigation to detail
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    Text("Recipes")
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                    Spacer()
                    List(viewModel.allRecipes){ cusine in
                        RecipeListViewCell(cusine: cusine)
                            .onTapGesture {
                                viewModel.selectedRecipe = cusine
                                viewModel.isShowingDetail = true
                            }
                    }
                    .listStyle(.plain)
                    //.disabled(viewModel.isShowingDetail)
                }
                .onAppear{
                    viewModel.fetchRecipes()
                }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
                if viewModel.isShowingDetail {
                    DetailListView(detailRecipe: viewModel.selectedRecipe!, isShowingDetail: $viewModel.isShowingDetail)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(1.5)
                        .padding()
                }
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    RecipeListView()
}

