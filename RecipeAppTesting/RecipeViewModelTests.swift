//
//  TestRecipeApp.swift
//
//  Created by Hanitha Dhavileswarapu on 11/22/24.
//

import XCTest
@testable import RecipeApp

final class TestRecipeApp: XCTestCase {
    let viewModel = RecipeViewModel(networkManager: MockNetworkManager.shared)
    
    override func setUp() {
        super.setUp()
    }
  
    func testFetchRecipes_Success() {
        viewModel.fetchRecipes()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotEqual(self.viewModel.allRecipes.count, 0)
            XCTAssertNotNil(self.viewModel.allRecipes)
            XCTAssertEqual(self.viewModel.allRecipes[0].name, "Apam Balik")
            XCTAssertNil(self.viewModel.alertItem)
        }
    }
    
    func testFetchRecipes_Success() {
        viewModel.recipeapiClient.downloadImage(fromURLString: <#T##String#>, completed: <#T##(UIImage?) -> Void#>)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotEqual(self.viewModel.allRecipes.count, 0)
            XCTAssertNotNil(self.viewModel.allRecipes)
            XCTAssertEqual(self.viewModel.allRecipes[0].name, "Apam Balik")
            XCTAssertNil(self.viewModel.alertItem)
        }
    }
}
