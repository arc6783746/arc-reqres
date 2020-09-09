//
//  UserData.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import Foundation

class UserData: NSObject, Codable {
    var first_name: String?, last_name: String?, avatar: String?
    
    private enum CodingKeys: String, CodingKey {
        case first_name
        case last_name
        case avatar
    }
    
    override init() {
        first_name = nil
        last_name = nil
        avatar = nil
    }
}
