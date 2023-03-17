//
//  UserModel.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 23.02.2023.
//

import Foundation


struct User: Codable {
    
    let firstName: String?
    let lastName: String?
    let login: String
    let password: String
}
