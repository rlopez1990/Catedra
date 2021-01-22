//
//  WebViewController.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 18/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    // MARK - Private Properties
    @IBOutlet private weak var mainWebView: WKWebView!
    private var loaderView = LoaderView()
    
    static let mailto = "mailto"
    
    // MARK - Public Properties
    var path: SectionPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainWebView.navigationDelegate = self
        mainWebView.scrollView.delegate = self

        if let url = APIClient.url(for: path) {
            let urlRequest = URLRequest(url: url)
            mainWebView.load(urlRequest)
            loaderView.addLoadView(inView: view)
        }
    }

}
// MARK - WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loaderView.removeLoadView()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loaderView.removeLoadView()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated,
            let url = navigationAction.request.url {
            UIApplication.shared.open(url)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
}


extension WebViewController: UIScrollViewDelegate {
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
}
