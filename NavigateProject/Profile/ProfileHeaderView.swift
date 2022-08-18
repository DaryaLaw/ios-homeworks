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
    
    private lazy var listeningToMusicTextField: UITextField = {
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
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.backgroundColor = .blue
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.addTarget(Any.self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
    }

    private func setupView() {
        self.backgroundColor = .lightGray
        self.addSubview(self.catImageView)
        self.addSubview(self.catLabel)
        self.addSubview(self.listeningToMusicTextField)
        self.addSubview(self.showStatusButton)
           
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            catImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            catImageView.heightAnchor.constraint(equalToConstant: 100),
            catImageView.widthAnchor.constraint(equalToConstant: 100),
                
            catLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            catLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
            listeningToMusicTextField.bottomAnchor.constraint(equalTo: self.showStatusButton.topAnchor, constant: -34),
            listeningToMusicTextField.heightAnchor.constraint(equalToConstant: 40),
            listeningToMusicTextField.leadingAnchor.constraint(equalTo: self.catImageView.trailingAnchor, constant: 16),
            listeningToMusicTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                
            showStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showStatusButton.topAnchor.constraint(equalTo: self.catImageView.bottomAnchor, constant: 16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    

    @objc private func buttonPressed() {
        if let text = listeningToMusicTextField.text {
            print(text)
        }
    }
    
    func addOurTarget(target: Any?, action: Selector, ourFor: UIControl.Event) {
        showStatusButton.addTarget(target, action: action, for: ourFor)
    }

}
