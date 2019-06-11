//
//  promptVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
import CoreData
class PromptViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    var img: UIImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.promptLabel.text = "Take a photo of/with: \(item.currItem())"
        if(camera){
            camera=false
            let alert = UIAlertController(title: "AI Is Working!", message: "This can take up to 30 seconds!", preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true, completion: nil)
            
            // RUN this in the background so we can show the pop up box
            let dispatchQueue = DispatchQueue(label: "Check if image is correct", qos: .background)
            dispatchQueue.async {
                //userID = deviceID, image=image sent, word = word that is being looked for
                correct = APICommands(userID: UIDevice.current.identifierForVendor!.uuidString).checkImg(image: self.img, word: item.currItem())
                if(correct){
                    result="manged"
                } else {
                    result="failed"
                }
                
                alert.dismiss(animated: true, completion: nil)
                
                let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resultsVC")
                self.present(vc, animated: true)
            }
        } else {
            //sleep is here to let view load properly and give user time to read the prompt
            sleep(1)
            //runs timer
            var timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] (_)  in
                time += 0.1
                self!.timerLabel.text = String(format: "%.1f", time)
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
        //uses album if camera isn't avaliable on device
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let localimg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //sends in image to be checked (and userID is set to the deviceID)
            camera = true
            img=localimg
            dismiss(animated: true, completion: nil)
            viewDidLoad()
        } else {
            print("ERROR WITH IMAGE SELECTION")
        }
    }
}
