//
//  UserManager.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 23.02.2023.
//

import Foundation

protocol UserManagerProtocol {
    func saveUser(firstName: String, lastName: String, login: String, password: String)
    func saveActiveUser(user: User)
    var users: [User] { get set }
    var activeUser: User? { get set }
}

class UserManager: UserManagerProtocol {
    
    enum SettingsKeys: String {
        case users
        case activeUser
    }
    
    let defaults = UserDefaults.standard
    let usersKey = SettingsKeys.users.rawValue
    let activeUsersKey = SettingsKeys.activeUser.rawValue
    
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: usersKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: usersKey)
            }
        }
    }
    
    func saveUser(firstName: String, lastName: String, login: String, password: String) {
        
        let user = User(firstName: firstName, lastName: lastName, login: login, password: password)
        users.insert(user, at: 0)
    }
    
    var activeUser: User? {
        get {
            if let data = defaults.value(forKey: activeUsersKey) as? Data {
                return try! PropertyListDecoder().decode(User.self, from: data)
            } else {
                return nil
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: activeUsersKey)
            }
        }
    }
    
    func saveActiveUser(user: User) {
        activeUser = user
        defaults.set(true, forKey: "isLogged")
    }
    
}
