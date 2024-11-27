//
//  Alerts.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/8/24.
//

import Foundation
import SwiftUI


struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData     = AlertItem(title: Text("Server Error"),
                                           message: Text("Data received from the server is invalid. Please contact support for assistance."),
                                           dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from server."),
                                           dismissButton: .default(Text("OK")))
    static let invalidURL      = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid url. please check the url."),
                                            dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. check internet connection"),
                                            dismissButton: .default(Text("OK")))
}
