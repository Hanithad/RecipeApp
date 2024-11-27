//
//  Alerts.swift
//
//  Created by Hanitha Raghava on 11/24/24.
//

import Foundation
import SwiftUI

struct Alerts: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData     = Alerts(title: Text("Server Error"),
                                           message: Text("Data received from the server is invalid. Please contact support for assistance."),
                                           dismissButton: .default(Text("OK")))
    static let invalidResponse = Alerts(title: Text("Server Error"),
                                           message: Text("Invalid response from server."),
                                           dismissButton: .default(Text("OK")))
    static let invalidURL      = Alerts(title: Text("Server Error"),
                                            message: Text("Invalid url. please check the url."),
                                            dismissButton: .default(Text("OK")))
    static let unableToComplete = Alerts(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. check internet connection"),
                                            dismissButton: .default(Text("OK")))
    static let noData = Alerts(title: Text("No Reciepes Available"),
                               message: Text("No Recipes Available"),
                                dismissButton: .default(Text("OK")))
}
