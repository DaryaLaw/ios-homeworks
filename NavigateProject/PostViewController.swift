//
//  PostViewController.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    let feedViewController = FeedViewController()
    
    @objc func sendToInfoVC(sender: UIButton) {
        let vc = InfoViewController()
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        self.title = feedViewController.post1.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Legal documentation", style: .done, target: self, action: #selector(sendToInfoVC(sender:)))
        // Do any additional setup after loading the view.
    }
}
