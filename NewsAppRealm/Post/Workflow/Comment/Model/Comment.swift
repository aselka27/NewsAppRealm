//
//  Comment.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 29.07.2022.
//

import Foundation
import RealmSwift

class Comment: Object, Codable {
    @objc dynamic var name: String?
    @objc dynamic var postId: Int = 1
}
