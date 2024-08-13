//
//  HtmlText.swift
//  FirstRowSwiftUI
//
//  Created by Maruf Khan on 9/8/24.
//

import SwiftUI
import WebKit

struct HTMLTextView: UIViewRepresentable {
    let htmlContent: String
    let maxLines: Int? // Make this optional to handle the case when it's not provided
    let fontSize: CGFloat
    let colorString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.backgroundColor = .clear
        webView.isOpaque = false
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.isUserInteractionEnabled = false
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // Determine the line clamp CSS if maxLines is provided
        let lineClampCSS: String
        if let maxLines = maxLines {
            lineClampCSS = """
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: \(maxLines);
            -webkit-box-orient: vertical;
            """
        } else {
            lineClampCSS = "" // No line clamping, load full content
        }
        
        let htmlString = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            font-size: \(fontSize)px;
            color: \(colorString);
            \(lineClampCSS)
        }
        </style>
        </head>
        <body>
        \(htmlContent)
        </body>
        </html>
        """
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}

