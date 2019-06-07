//
//  promptVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
class PromptViewController: UIViewController{
    @IBOutlet weak var promptImg: UIImageView!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    //function called when camera button is pressed
    @IBAction func cameraPressed(_ sender: Any) {
        openCamera()
    }
    //opens up camera for use that will send user to results screen when finished
    func openCamera(){
    
    }
}
