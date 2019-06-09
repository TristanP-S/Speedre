//
//  promptVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
//checks if camera just completed
class PromptViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var promptImg: UIImageView!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //function called when camera button is pressed
    @IBAction func cameraPressed(_ sender: Any) {
        openCamera()
    }
    //opens up camera for use that will send user to results screen when finished
    func openCamera(){
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resultsVC")
        let imagePicker = UIImagePickerController()
       //CHANGE TO .camera LATER, THIS IS BECAUSE CAMERA ISN'T AVAILIABLE ON SIM (oly .photoLibrary is)
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        //self.present(vc, animated: true) <- set this for completion
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            promptImg.image = img
            APICommands(userID: "fubar").checkImg(image: img)
        } else {
            print("ERROR WITH IMAGE SELECTION")
        }
    }
}
