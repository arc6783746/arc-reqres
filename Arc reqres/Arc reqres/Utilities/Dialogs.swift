//
//  Dialogs.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import Foundation
import UIKit

class Dialogs {
    func genericConnectionErrorDialog() -> UIAlertController {
        let alert = UIAlertController(title: "Connection error", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    func fillFieldsDialog() -> UIAlertController {
        let alert = UIAlertController(title: "Warning", message: "Please make sure you have filled in all fields, and try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    func loginFailureDialog() -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: "Login failed. Please make sure the info you have provided is accurate.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    func loginSuccessDialog() -> UIAlertController {
        let alert = UIAlertController(title: "Success", message: "Registration successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}
