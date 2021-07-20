//
//  WebViewController.swift
//  WebViewApplication
//
//  Created by Marius-Ștefăniță Jianu on 20.07.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private let webView: WKWebView =  {
        
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print("Start loading")
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("End loading")
        }
        return webView
    }()
    
    private let url: URL
    
    init(url:URL, titile: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        webView.load(URLRequest(url: url))
        configureButtons()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    private func configureButtons () {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefresh))

    }
    
    @objc private func didTapDone() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func didTapRefresh() {
        webView.load(URLRequest(url: url))
    }
    
}
