//
//  ProfileHeaderView.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var catLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster cat"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var catImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "cat")
        imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var listeningToMusicTextField: UITextField = {
        let textfield = UITextField()
        textfield.layer.cornerRadius = 12
        textfield.placeholder = "   Listening to music"
        textfield.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textfield.textColor = .black
        textfield.font = .systemFont(ofSize: 15)
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 1
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private(set) lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        self.addSubview(self.catImageView)
        self.addSubview(self.catLabel)
        self.addSubview(self.listeningToMusicTextField)
        self.addSubview(self.showStatusButton)
        catImageViewConstraints()
        catLabelConstraints()
        listeningToMusicTextFieldConstraints()
        showStatusButtonConstraints()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        self.addSubview(self.catImageView)
        self.addSubview(self.catLabel)
        self.addSubview(self.listeningToMusicTextField)
        self.addSubview(self.showStatusButton)
        catImageViewConstraints()
        catLabelConstraints()
        listeningToMusicTextFieldConstraints()
        showStatusButtonConstraints()
    }
    
    private func catImageViewConstraints() {
        self.catImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        self.catImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.catImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.catImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    private func catLabelConstraints() {
        self.catLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        self.catLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    private func listeningToMusicTextFieldConstraints() {
        self.listeningToMusicTextField.bottomAnchor.constraint(equalTo: self.showStatusButton.topAnchor, constant: -34).isActive = true
        self.listeningToMusicTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.listeningToMusicTextField.leadingAnchor.constraint(equalTo: self.catImageView.trailingAnchor, constant: 16).isActive = true
        self.listeningToMusicTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    private func showStatusButtonConstraints() {
        self.showStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.showStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        self.showStatusButton.topAnchor.constraint(equalTo: self.catImageView.bottomAnchor, constant: 16).isActive = true
        self.showStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
