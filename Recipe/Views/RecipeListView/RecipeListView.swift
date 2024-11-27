//
//  ContentView.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var viewModel = RecipeViewModel(networkManager: NetworkManager.shared)
    @State private var selectedItem: String?
    @State private var isShowing = false
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    Text("Recipes")
                        .font(.title)
                        .bold()
                        .foregroundColor(.primary)
                    Spacer()
                    List(viewModel.allRecipes ?? []){ cusine in
                        RecipeListViewCell(cusine: cusine)
                            .onTapGesture {
                                viewModel.selectedRecipe = cusine
                                viewModel.isShowingDetail = true
                            }
                    }
                    .listStyle(.plain)
                }
                .onAppear{
                    viewModel.fetchRecipes()
                }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
                if viewModel.isShowingDetail, let selectedRecipe = viewModel.selectedRecipe {
                    RecipeDetailView(detailRecipe: selectedRecipe, isShowingDetail: $viewModel.isShowingDetail)
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

