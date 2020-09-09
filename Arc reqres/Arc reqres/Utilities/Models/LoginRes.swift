//
//  LoginRes.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import Foundation

class LoginRes: NSObject, Codable {
    var id: Int?, token: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case token
    }
    
    override init() {
        id = nil
        token = nil
    }
}
