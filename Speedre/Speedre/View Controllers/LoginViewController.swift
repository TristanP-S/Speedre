//
//  loginVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
class LoginViewController: UIViewController{
    //whats happens when login button is tapped
    @IBAction func loginTapped(_ sender: Any) {
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "promptVC")
        self.present(vc, animated: true)
    }
}
