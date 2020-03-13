//
//  ContentVC.swift
//  Practical_Thewebpatriot
//
//  Created by Sagar on 13/03/20.
//  Copyright © 2020 Sagar. All rights reserved.
//

import UIKit
import WebKit


class ContentVC: UIViewController {

    
     @IBOutlet var wkWebView: WKWebView!
    
     var strUrl : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         showLoader("")
        wkWebView.navigationDelegate = self
        if let url = URL(string: strUrl){
            let request = URLRequest(url: url)
            wkWebView.load(request)
        }
    }
}




extension ContentVC: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoader()
        print("Load")
    }
    
    
}


extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
