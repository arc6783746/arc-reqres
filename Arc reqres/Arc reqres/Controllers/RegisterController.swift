//
//  RegisterController.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import UIKit
import SDWebImage

class RegisterController: UIViewController, LoginDelegate {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var firstnameLbl: UILabel!
    @IBOutlet weak var lastnameLbl: UILabel!
    @IBOutlet weak var avatarIv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonView.isHidden = false
        buttonView.isUserInteractionEnabled = true
        profileView.isHidden = true
        profileView.isUserInteractionEnabled = false
    }
    
    func loginResult(_ user: User) {
        present(dialogs.loginSuccessDialog(), animated: true, completion: nil)
        
        buttonView.isHidden = true
        buttonView.isUserInteractionEnabled = false
        profileView.isHidden = false
        profileView.isUserInteractionEnabled = true
        
        firstnameLbl.text = user.data?.first_name
        lastnameLbl.text = user.data?.last_name
        avatarIv.sd_setImage(with: URL(string: user.data?.avatar ?? ""), placeholderImage: #imageLiteral(resourceName: "profile"))
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginController") as! LoginController
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}
