//
//  ViewController.swift
//  optionalBoard
//
//  Created by 松島優希 on 2020/12/11.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var indicator:
        UIActivityIndicatorView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-toolBar.frame.height)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        //URLロード
        let url = URL(string: "https://www.kurashiru.com/")
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        indicator.layer.zPosition = 2
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //ロードが完了したときに呼ばれるデリゲートメソッド
        indicator.isHidden = true
        indicator.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //ロード中に呼ばれるメソッド
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
        
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    
}

