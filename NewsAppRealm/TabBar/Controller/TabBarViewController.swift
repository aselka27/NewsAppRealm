//
//  ViewController.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Property
       
       private let usersVC = UINavigationController(rootViewController: UserTableViewController())
       private let postsVC = UINavigationController(rootViewController: PostTableViewController())
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureUI()
    }
    
    // MARK: - Configure UI
    private func configureUI() {
            postsVC.title = "All posts"
            usersVC.title = "All users"
            
            tabBar.tintColor = .systemBlue
            
            assignVC()
            setImages()
        }
        
        private func assignVC() {
            setViewControllers([postsVC, usersVC], animated: true)
        }
        
        private func setImages() {
            guard let items = self.tabBar.items else {return}
            let images = ["paperplane", "person"]
            for i in 0...images.count-1 {
                items[i].image = UIImage(systemName: images[i])
            }
        }


}

