//
//  ProfileViewController.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

//import UIKit
//
//class ProfileViewController: UIViewController {
//    
//    
//    
//        private lazy var firstButton: UIButton = {
//            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//            button.backgroundColor = .blue
//            button.setTitle("Profile", for: .normal)
//            button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
//            return button
//        }()
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            self.view.backgroundColor = .systemGreen
//            
//            self.view.addSubview(self.firstButton)
//            self.firstButton.center = self.view.center
//        }
//        
//        @objc private func didTapButton() {
//            let vc = FeedViewController()
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true)
//        }
//    }
