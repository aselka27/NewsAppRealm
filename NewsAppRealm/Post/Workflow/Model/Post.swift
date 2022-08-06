//
//  Post.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import Foundation
import RealmSwift

class Post: Object, Codable {
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var id: Int = 1
}
