//
//  RealmService.swift
//  NewsAppRealm
//
//  Created by саргашкаева on 2.08.2022.
//

import Foundation
import RealmSwift

class RealmService {
    
    static var realm = try! Realm()
    
    static func create<T: Object>(_ object: T) {
        do {
            try RealmService.realm.write({
                RealmService.realm.add(object)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func delete<T: Object>(result: Results<T>) {
        do {
            try RealmService.realm.write({
                RealmService.realm.delete(result)
            })
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
