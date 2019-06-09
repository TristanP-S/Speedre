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
var camera = false
//timer
var time = 0.0
class PromptViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(camera){
        camera=false
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resultsVC")
        present(vc, animated: true)
        } else {
            //sleep is here to let view load properly and give user time to read the prompt
            sleep(1)
            //runs timer
            var timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] (_)  in
                time += 0.1
                self!.timerLabel.text = String(time)
            })
            
        }
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
            //sends in image to be checked (and userID is set to the deviceID)
            camera = APICommands(userID: UIDevice.current.identifierForVendor!.uuidString).checkImg(image: img, word: "bird")
            dismiss(animated: true, completion: nil)
            viewDidLoad()
        } else {
            print("ERROR WITH IMAGE SELECTION")
        }
    }
}
