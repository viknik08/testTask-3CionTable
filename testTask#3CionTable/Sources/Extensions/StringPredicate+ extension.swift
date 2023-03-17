//
//  StringPredicate+ extension.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 27.02.2023.
//

import Foundation

extension String {
    
    enum ValidType {
        case name
        case login
        case password
    }
    
    enum Regex: String {
        case name = "[a-zA-Z]{2,}"
        case login = "[a-zA-Z0-9._]{3,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .name:
            regex = Regex.name.rawValue
        case .login:
            regex = Regex.login.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}



