//
//  InfoViewController.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
//На InfoViewController создайте кнопку. При нажатии на неё должен показаться UIAlertController с заданным title, message и двумя UIAlertAction. При нажатии на UIAlertAction в консоль должно выводиться сообщение.
    
    private lazy var termsOfUseButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        //button.setImage(UIImage(systemName: "button"), for: .normal)
        button.backgroundColor = .white
        button.setTitle("Show documentation", for: .normal)
        button.addTarget(self, action: #selector(self.didTapTermsOfUseButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = .systemPurple
        view.backgroundColor = .yellow
        
        self.view.addSubview(self.termsOfUseButton)
        self.termsOfUseButton.center = self.view.center
    }
    
    @objc private func didTapTermsOfUseButton() {
//        self.dismiss(animated: true)
//        self.navigationController?.popViewController(animated: true)
        
        let alertController = UIAlertController(title: "Terms of Use", message: "I accept these Terms of Use", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "I accept", style: .default) { _ in
            print("I accept")
        }
        let secondAction = UIAlertAction(title: "Do not accept", style: .destructive) { _ in
            print("Do not accept")
        }
       
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
    }
}
