//
//  RecipeViewModel.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//
import SwiftUI

class RecipeViewModel: ObservableObject {
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    var recipeapiClient: RecipeAPIClient = RecipeAPIClient(networkManger: NetworkManager.shared)
    var networkManager: NetworkManagerProtocol = NetworkManager.shared
    
    @Published var allRecipes: [Recipe]?
    @Published var alertItem: Alerts?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedRecipe: Recipe?
    
    var recipeURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    func fetchRecipes() {
        isLoading = true
        recipeapiClient.networkManger = networkManager
        recipeapiClient.getRecipes(recipeUrl: recipeURL) { [weak self] result in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                self?.isLoading = false
                switch result {
                case .success(let recipes):
                    if (recipes.count == 0) {
                        self?.showError(error: NetworkError.noData)
                    } else{
                        self?.alertItem = nil
                        self?.allRecipes = recipes
                    }
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
        case .noData:
            alertItem = AlertContext.noData
        }
    }
}

