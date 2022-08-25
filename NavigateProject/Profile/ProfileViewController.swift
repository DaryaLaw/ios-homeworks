//
//  ProfileViewController.swift
//  NavigateProject
//
//  Created by Darya on 25.07.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private var viewModel: [Post] = [
        Post(author: "@Lis", image: "Post1", description: "Самые лучшие друзья на свете", likes: 125, views: 146),
        Post(author: "@Elvis", image: "Post2", description: "Вместе уютнее", likes: 102, views: 198),
        Post(author: "@Lis", image: "Post3", description: "Поваляться всегда в радость", likes: 127, views: 168),
        Post(author: "@Elvis", image: "Post4", description: "Самые элегантнае коты", likes: 156, views: 201)]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }

    private func setupNavigationBar() {
       navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileHeaderView {
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(200.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell {
            cell.authorLabel.text = viewModel[indexPath.row].author
            cell.postImageView.image = UIImage(named: viewModel[indexPath.row].image)
            cell.descriptionLabel.text = viewModel[indexPath.row].description
            cell.likesViewsLabel.text = "likes: \(viewModel[indexPath.row].likes) views: \(viewModel[indexPath.row].views)"
            return cell
        }
            return UITableViewCell()
    }
}
