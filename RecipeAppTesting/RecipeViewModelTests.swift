//
//  RecipeViewModelTests.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import XCTest
@testable import RecipeApp

final class TestRecipeViewModel: XCTestCase {
    let viewModel = RecipeViewModel(networkManager: MockNetworkManager.shared)
    
    func testFetchRecipes_Success() {
        viewModel.fetchRecipes()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotEqual(self.viewModel.allRecipes?.count, 0)
            XCTAssertNotNil(self.viewModel.allRecipes)
            XCTAssertEqual(self.viewModel.allRecipes?[0].name, "Apam Balik")
            XCTAssertNil(self.viewModel.alertItem)
        }
    }
    func testFetchRecipesData_Failure_malformed() {
            viewModel.recipeURL = " https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                XCTAssertNil(self.viewModel.allRecipes)
            }
    }
    func testFetchRecipes_Failure_empty() {
        viewModel.recipeURL = " https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
        viewModel.fetchRecipes()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNil(self.viewModel.allRecipes)
        }
    }
    
}
