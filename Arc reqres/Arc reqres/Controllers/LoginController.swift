//
//  LoginController.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

protocol LoginDelegate: class {
    func loginResult(_ user: User)
}

class LoginController: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {
    weak var delegate: LoginDelegate?
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        emailTf.delegate = self
        passwordTf.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == emailTf) {
            passwordTf.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    @IBAction func continueClicked(_ sender: Any) {
        if (emailTf.text?.isEmpty ?? true || passwordTf.text?.isEmpty ?? true) {
            self.present(dialogs.fillFieldsDialog(), animated: true, completion: nil)
            return
        }
        
        let reqModel = ReqBody()
        reqModel.email = emailTf.text
        reqModel.password = passwordTf.text
        
        startAnimating(CGSize(width: 30, height: 30), message: "Loading", type:  NVActivityIndicatorType.allCases.filter { $0 != .blank }[22], fadeInAnimation: nil)
        
        manager.register(reqModel) { responseObject, error, responseCode in
            if (responseCode == 200){
                do {
                    let loginRes = try JSONDecoder().decode(LoginRes.self, from: (responseObject?.rawData())!)
                    
                    manager.login(loginRes.id ?? -1) { responseObject, error, responseCode in
                        self.stopAnimating()
                        
                        if (responseCode == 200){
                            do {
                                let user = try JSONDecoder().decode(User.self, from: (responseObject?.rawData())!)
                                self.dismiss(animated: true, completion: nil)
                                self.delegate?.loginResult(user)
                            } catch {
                                print(error)
                                self.present(dialogs.genericConnectionErrorDialog(), animated: true, completion: nil)
                            }
                        } else if (responseCode == -1) {
                            self.present(dialogs.genericConnectionErrorDialog(), animated: true, completion: nil)
                        } else {
                            self.present(dialogs.loginFailureDialog(), animated: true, completion: nil)
                        }
                    }
                } catch {
                    self.stopAnimating()
                    print(error)
                    self.present(dialogs.genericConnectionErrorDialog(), animated: true, completion: nil)
                }
            } else if (responseCode == -1) {
                self.stopAnimating()
                self.present(dialogs.genericConnectionErrorDialog(), animated: true, completion: nil)
            } else {
                self.stopAnimating()
                self.present(dialogs.loginFailureDialog(), animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
