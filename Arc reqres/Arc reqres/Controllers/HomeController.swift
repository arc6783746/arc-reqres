//
//  HomeController.swift
//  Arc reqres
//
//  Created by Arcael on 9/9/20.
//  Copyright © 2020 Arcael. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var homeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rotateHomeView(_:))))
    }
    
    @objc func rotateHomeView(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        self?.homeView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            }, completion: { success in
                UIView.animate(withDuration: 1,
                               delay: 0,
                               options: .curveEaseOut,
                               animations: { [weak self] in
                                self?.homeView.transform = CGAffineTransform(rotationAngle: 0.0)
                    }, completion: { success in
                })
        })
    }
}
