//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by yunus olgun on 16.02.2021.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init() { }
}
