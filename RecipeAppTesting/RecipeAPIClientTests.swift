//
//  RecipeAPIClientTests.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import XCTest
@testable import RecipeApp
import SwiftUI

final class TestRecipeAPIClient: XCTestCase {
    let apiClient = RecipeAPIClient(networkManger: MockNetworkManager.shared)
    
    func testDownloadImage_Success() {
        let url = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
        apiClient.downloadImage(fromURLString: url, completed: {image in
            XCTAssertNotNil(image)
        })
    }
    
    func testDownloadImage_Failure() {
        let url = "https://d3jbb8n5wk0qxi.cloudfrontzzz.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"
        apiClient.downloadImage(fromURLString: url, completed: {image in
            XCTAssertNil(image)
        })
        
    }
}
