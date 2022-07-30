//
//  ProfileViewController.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        
        return self.view as! ProfileHeaderView
    }()
    
        private lazy var profile = Profile(name: "Profile", image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = profile.name
        profileHeaderView.showStatusButton.addTarget(Any.self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        self.view = ProfileHeaderView()
    }
    
    @objc private func didTapButton() {
        let vc = FeedViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc private func buttonPressed() {
        let text = profileHeaderView.listeningToMusicTextField.text!
        print(text)
    }
    
}

