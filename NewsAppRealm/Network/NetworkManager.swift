//
//  NetworkManager.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import Foundation

class NetworkManager {
   
    func getPosts(completion: @escaping ([Post])->()){
        
        guard let postURL =  URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return}
        let postRequest = URLRequest(url: postURL)
        
        URLSession.shared.dataTask(with: postRequest) { data, request, error in
            if let error = error {
                print("\(error.localizedDescription) has occured")
                return
            }
            guard let data = data else {
                return
            }
            do {
                let post = try JSONDecoder().decode([Post].self, from: data)
                completion(post)
            } catch {
                print("Paring \(error) occured")
            }
        }.resume()
    }
    
    func getComments (url: URL, completion: @escaping ([Comment])->()) {
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("\(error.localizedDescription) has occured")
                return
            }
            guard let data = data else {
                return
            }
            do {
                let comment = try JSONDecoder().decode([Comment].self, from: data)
                completion(comment)
                print(comment)
            } catch {
                print("Parsing \(error) occured")
            }
        }.resume()
    }
    
    func getUserInfo (completion: @escaping ([User])->()) {
        
        guard let userInfoURL =  URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Invalid URL")
            return }
        let userInfoRequest = URLRequest(url: userInfoURL)
        
        URLSession.shared.dataTask(with: userInfoRequest) { data, response, error in
            if let error = error {
                print("\(error.localizedDescription) has occured")
                return
            }
            guard let data = data else {
                return
            }
            do {
                let user = try JSONDecoder().decode([User].self, from: data)
                completion(user)
            } catch {
                print("Paring \(error) occured")
            }
        }.resume()
    }
}
