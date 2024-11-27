//
//  RecipeViewModel.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/7/24.
//
import SwiftUI

class RecipeViewModel: ObservableObject {
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
        
    var recipeapiClient: RecipeAPIClient = RecipeAPIClient.shared
    var networkManager: NetworkManagerProtocol = NetworkManager.shared
    
    @Published var allRecipes: [Recipe] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedRecipe: Recipe?

    
    func fetchRecipes() {
        isLoading = true
        recipeapiClient.networkManger = networkManager
        // print("!!!!!!!!!!!!TThe network manager is \(networkManager)")
        recipeapiClient.getRecipes { [weak self] result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                self?.isLoading = false
                switch result {
                case .success(let recipes):
                    //print("Sucess block \(recipes)")
                    self?.alertItem = nil
                    self?.allRecipes = recipes
                case .failure(let error):
                    self?.showError(error: error)
                }
            }
        }
    }
    
    func showError(error: NetworkError){
        switch error {
        case .invalidResponse:
            alertItem = AlertContext.invalidResponse
        case .invalidURL:
            alertItem = AlertContext.invalidURL
        case .invalidData:
            alertItem = AlertContext.invalidData
        case .unableToComplete:
            alertItem = AlertContext.unableToComplete
        }
    }
}

