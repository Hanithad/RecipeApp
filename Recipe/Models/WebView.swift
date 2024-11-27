//
//  WebView.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/13/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url : URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

