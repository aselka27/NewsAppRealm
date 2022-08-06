//
//  UserTableViewController.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import UIKit
import RealmSwift

class UserTableViewController: UITableViewController {
    
    // MARK: - Properties
    var users: Results <User>?
    private let networkManager = NetworkManager()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All User"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.users = RealmService.realm.objects(User.self)
        getData()
    }
    
    // MARK: - Helpers
    private func saveToRealm(data: [User]? = nil) {
        guard let data = data else {return}
        if users != nil {
            RealmService.delete(result: users!)
        }
        for item in data {
            RealmService.create(item)
        }
        tableView.reloadData()
    }
    
    private func getData() {
        networkManager.getUserInfo { data in
            DispatchQueue.main.async {
                self.saveToRealm(data: data)
                self.tableView.reloadData()
                
            }
        }
    }
    
    
    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        let user = users?[indexPath.row]
        cell.textLabel?.text = user?.name
        cell.detailTextLabel?.text = user?.username
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UserInfoViewController()
        let user = users?[indexPath.row]
        
        if(user != nil){
            vc.nameLabel.text = "name = \(String(describing: user!.name))"
            vc.idLabel.text = "id = \(String(describing: user!.id))"
            vc.userNameLabel.text = "username = \(String(describing: user!.username))"
            vc.phoneLabel.text = "phone = \(String(describing: user!.phone))"
            vc.websiteLabel.text = "website = \(String(describing: user!.website))"
            vc.companyLabel.text = "company = \(String(describing: user!.company!.name!))"
            navigationController?.pushViewController(vc, animated: true)
        }}
}
