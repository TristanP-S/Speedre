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
        let imagePicker = UIImagePickerController()
       //CHANGE TO .camera LATER, THIS IS BECAUSE CAMERA ISN'T AVAILIABLE ON SIM (oly .photoLibrary is)
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resultsVC")
            promptImg.image = img
            //sends in image to be checked (and userID is set to the deviceID)
            APICommands(userID: UIDevice.current.identifierForVendor!.uuidString).checkImg(image: img)
            UIApplication.shared.keyWindow?.rootViewController!.present(vc, animated: true)
            dismiss(animated: true, completion: nil)
        } else {
            print("ERROR WITH IMAGE SELECTION")
        }
    }
}
