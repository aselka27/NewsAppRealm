//
//  UserInfoViewController.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    
    
    // MARK: - Views
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        title = "User Info"
      
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        view.backgroundColor = .white
        setUpViews()
        setUpConstraints()
    }
    
    private func setUpViews() {
        view.addSubview(verticalStack)
        verticalStack.addArrangedSubview(idLabel)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(userNameLabel)
        verticalStack.addArrangedSubview(phoneLabel)
        verticalStack.addArrangedSubview(websiteLabel)
        verticalStack.addArrangedSubview(companyLabel)
    }
    private func setUpConstraints() {
        let constraints = [
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
