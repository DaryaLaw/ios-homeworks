//
//  FeedViewController.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

import UIKit

class FeedViewController: UIViewController {
//Добавьте кнопку на FeedViewController и сделайте переход на экран поста. Контроллер должен показаться в стеке UINavigationController.
//Создайте структуру Post со свойством title: String. Создайте объект типа Post в FeedViewController и передайте его в PostViewController.
    
    var post1 = Post(title: "The most important news of all time")
    private lazy var postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemRed
        button.setTitle("Go to news feed", for: .normal)
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        
        self.view.addSubview(self.postButton)
        self.postButton.center = self.view.center
    }
    
    @objc private func didTapButton() {
        let didTapButton = PostViewController()
        self.navigationController?.pushViewController(didTapButton, animated: true)
    }
}
