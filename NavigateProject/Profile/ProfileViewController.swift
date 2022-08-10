//
//  ProfileViewController.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var changeTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change title", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.backgroundColor = .blue
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    private lazy var profile = Profile(name: "Profile", image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.changeTitleButton)
        self.title = profile.name
        profileHeaderView.addOurTarget(target: Any.self, action: #selector(buttonPressed), ourFor: .touchUpInside)
        let profileHeaderViewContraints = self.profileHeaderViewContraints()
        let changeTitleButtonContraints = self.changeTitleButtonContraints()
        NSLayoutConstraint.activate(profileHeaderViewContraints + changeTitleButtonContraints)
    }
    
    override func loadView() {
        super.loadView()
    }
    
    @objc private func didTapButton() {
        let feedView = FeedViewController()
        feedView.modalPresentationStyle = .fullScreen
        self.present(feedView, animated: true)
    }
    
    @objc private func buttonPressed() {
        let text = profileHeaderView.getText()
        print(text)
    }
    
    private func profileHeaderViewContraints() -> [NSLayoutConstraint] {
        let topAnchor = NSLayoutConstraint(item: self.profileHeaderView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let leftAnchor = self.profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightAnchor = self.profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let heightAnchor = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        return [topAnchor, leftAnchor, rightAnchor, heightAnchor]
    }
    
    private func changeTitleButtonContraints() -> [NSLayoutConstraint] {
        let bottomAnchor = NSLayoutConstraint(item: self.changeTitleButton, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        let leftAnchor = self.changeTitleButton.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightAnchor = self.changeTitleButton.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let heightAnchor = self.changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
        
        return [bottomAnchor, leftAnchor, rightAnchor, heightAnchor]
    }
}

