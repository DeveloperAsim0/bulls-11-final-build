//
//  WebViewHelpViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 17/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import WebKit

class WebViewHelpViewController: UIViewController, WKNavigationDelegate {

var webview: WKWebView!

   override func viewDidLoad() {
    super.viewDidLoad()
    webview = WKWebView()
    webview.navigationDelegate = self
    view = webview
    let url = URL(string: "http://projectstatus.co.in/Bulls11/html/helpcenter.html")!
    webview.load(URLRequest(url: url))
    webview.allowsBackForwardNavigationGestures = true
    // Do any additional setup after loading the view.
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
