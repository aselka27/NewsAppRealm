//
//  CommentTableViewController.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import UIKit
import RealmSwift

class CommentTableViewController: UITableViewController {
    
    // MARK: - Properties
    var id: String = "1"
    var comments: Results<Comment>?
    
    private let networkManager = NetworkManager()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getData()
        self.comments = RealmService.realm.objects(Comment.self)
        
        print(id)
    }
    
    
    // MARK: - Helpers
    private func saveToRealm(data: [Comment]? = nil) {
        guard let data = data else {return}
        if comments != nil {
            RealmService.delete(result: comments!)
        }
        for item in data {
            RealmService.create(item)
        }
        tableView.reloadData()
    }
    
    private func getData() {
        networkManager.getComments(url: URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)/comments")!) { [weak self] data in
            DispatchQueue.main.async {
                self?.saveToRealm(data: data)
                self?.tableView.reloadData()
            }
        }
    }
    

    // MARK: - TablViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comment = comments?[indexPath.row]
        cell.textLabel?.text = comment?.name
        return cell
    }
}
