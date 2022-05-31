//
//  ViewController.swift
//  WebChallenge
//
//  Created by Hyojeong_Jun on 2022/05/31.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
       
    }
    
    
}

