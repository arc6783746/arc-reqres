//
//  Utils.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

//Genikh klash pou krataei ta global objects (an yparxoun), ta extentions wste na einai sygkentrwmena, kai voh8htikes me8odous

import Foundation
import UIKit

let utils = Utils()
let dialogs = Dialogs()
let manager = Manager()
let rootUrl = "https://reqres.in"

class Utils {
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
