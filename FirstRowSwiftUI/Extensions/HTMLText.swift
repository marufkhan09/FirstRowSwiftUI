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
    let maxLines: Int
    let fontSize: CGFloat
    let paddingTop: CGFloat
    let paddingRight: CGFloat
    let paddingBottom: CGFloat
    let paddingLeft: CGFloat
    let marginTop: CGFloat
    let marginRight: CGFloat
    let marginBottom: CGFloat
    let marginLeft: CGFloat
    
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
        let htmlString = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            font-size: \(fontSize)px;
            color: white;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: \(maxLines);
            -webkit-box-orient: vertical;
            padding-top: \(paddingTop)px;
            padding-right: \(paddingRight)px;
            padding-bottom: \(paddingBottom)px;
            padding-left: \(paddingLeft)px;
            margin-top: \(marginTop)px;
            margin-right: \(marginRight)px;
            margin-bottom: \(marginBottom)px;
            margin-left: \(marginLeft)px;
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
