//
//  LogInViewController.swift
//  NavigateProject
//
//  Created by Darya on 12.08.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var vkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VKImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.layer.borderWidth = 0.5
        stackView.backgroundColor = .black
        stackView.setCustomSpacing(0.5, after: loginTextField)
        stackView.layer.borderColor = CGColor(gray: 0.1, alpha: 1)
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "   Email or phone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
       
        textField.backgroundColor = .systemGray6
        textField.placeholder = "   Password"
        textField.textColor = .black
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "MyBlue")
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(Any.self, action: #selector(goToProfile), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginTextField.becomeFirstResponder()
    }
    
    @objc func goToProfile() {
        let vc = ProfileViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(self.vkImageView)
        scrollView.addSubview(self.textFieldsStackView)
        scrollView.addSubview(self.loginButton)
        
        NSLayoutConstraint.activate([
           scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
           scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
           scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
           scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

           vkImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
           vkImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            vkImageView.widthAnchor.constraint(equalToConstant: 100),
            vkImageView.heightAnchor.constraint(equalToConstant: 100),

            textFieldsStackView.topAnchor.constraint(equalTo: self.vkImageView.bottomAnchor, constant: 120),
            textFieldsStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            textFieldsStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            loginButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            loginButton.topAnchor.constraint(equalTo: self.textFieldsStackView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
 
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = loginButton.frame.origin.y + loginButton.frame.height
            let keyboardOriginY = view.frame.height - keyboardHeight // keyboardRectangle.origin.y
            
            let offset = keyboardOriginY <= loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0
            
            scrollView.contentOffset = CGPoint(x: 0, y: 100)
            }
}

    @objc private func didHideKeyboard(_ notification: Notification) {
       hideKeyboard()
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
        scrollView.setContentOffset(.zero, animated: true)
    }
}
