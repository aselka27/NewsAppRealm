//
//  PostTableViewController.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import UIKit
import RealmSwift

class PostTableViewController: UITableViewController {
    
    
    // MARK: - Properties
    private let fetcher = NetworkManager()
    var posts: Results<Post>?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Posts"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        posts = RealmService.realm.objects(Post.self)
        getData()
    }
    
    // MARK: - Helpers
    private func saveToRealm(data: [Post]? = nil) {
        guard let data = data else {return}
        if posts != nil {
            RealmService.delete(result: posts!)
        }
        for item in data {
            RealmService.create(item)
        }
        tableView.reloadData()
    
    }
    
    private func getData() {
        fetcher.getPosts { [weak self] data in
            DispatchQueue.main.async {
                self?.saveToRealm(data: data)
                self?.tableView.reloadData()
            }
        }
    }
    
   
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  posts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        let post = posts?[indexPath.row]
        cell.prepareForReuse()
        cell.textLabel?.text = post?.title
        cell.detailTextLabel?.text = post?.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CommentTableViewController()
        vc.id = "\(indexPath.row+1)"
        navigationController?.pushViewController(vc, animated: true)
    }
}

