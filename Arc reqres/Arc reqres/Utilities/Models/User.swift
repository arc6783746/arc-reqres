//
//  User.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import Foundation

class User: NSObject, Codable {
    var data: UserData?
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
    
    override init() {
        data = nil
    }
}
