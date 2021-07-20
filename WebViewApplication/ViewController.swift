//
//  ViewController.swift
//  WebViewApplication
//
//  Created by Marius-Ștefăniță Jianu on 20.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
       
        let button = UIButton()
        button.setTitle("Show WebPage", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        button.center = view.center
    }
    
    @objc private func didTapButton(){
        guard let url = URL(string: "https://beta.bancatransilvania.ro/") else {
            return
        }
        let vc = WebViewController(url: url, titile: "BT")
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
}
