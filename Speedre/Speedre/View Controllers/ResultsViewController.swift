//
//  resultsVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
class ResultsViewController: UIViewController{
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    //fucntion called when try again is pressed
    @IBAction func tryAgainPressed(_ sender: Any) {
        PromptViewController().openCamera()
    }
    //function called when new item is pressed
    @IBAction func newItemPressed(_ sender: Any) {
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "promptVC")
        self.present(vc, animated: true)
    }
    //function called when "All Scores" is pressed
    @IBAction func allScoresPressed(_ sender: Any) {
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "scoreVC")
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true)
    }
}
