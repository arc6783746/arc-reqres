//
//  ReqBody.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import Foundation

class ReqBody: NSObject, Codable {
    var email: String?, password: String?
    
    private enum CodingKeys: String, CodingKey {
        case email
        case password
    }
    
    override init() {
        email = nil
        password = nil
    }
}
