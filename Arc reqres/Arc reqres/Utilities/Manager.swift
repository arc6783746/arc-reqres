//
//  Manager.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

class Manager {
    func register(_ reqModel: ReqBody, completionHandler: @escaping (JSON?, Error?, _ responseCode: Int) -> ()) {
        var statusCode = -1
        
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(reqModel)
        
        var request = try! URLRequest(url: URL(string: ("\(rootUrl)/api/register"))!, method: .post)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Alamofire.request(request).responseSwiftyJSON { response in
            statusCode = (response.response?.statusCode ?? -1)
            if(statusCode == 200){
                completionHandler(response.result.value, nil, statusCode)
            }else{
                completionHandler(nil, "error" as? Error, statusCode)
            }
        }
    }
    
    func login(_ userId: Int, completionHandler: @escaping (JSON?, Error?, _ responseCode: Int) -> ()) {
        var statusCode = -1
        
        var request = try! URLRequest(url: URL(string: ("\(rootUrl)/api/users/\(userId)"))!, method: .get)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request).responseSwiftyJSON { response in
            statusCode = (response.response?.statusCode ?? -1)
            if(statusCode == 200){
                completionHandler(response.result.value, nil, statusCode)
            }else{
                completionHandler(nil, "error" as? Error, statusCode)
            }
        }
    }
}
