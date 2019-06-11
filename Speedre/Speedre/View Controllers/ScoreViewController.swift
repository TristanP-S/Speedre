//
//  scoresVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
import CoreData
class ScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //scores for tableview
    var scores: [Score] = []
    
    @IBOutlet weak var tableView: UITableView!
    func fetchInfo () {
        let fetchRequest: NSFetchRequest<Score> = Score.fetchRequest()
        do {
            scores = []
            // get the scores
            let result = try dataController.viewContext.fetch(fetchRequest)
            scores=result
        } catch {
            return
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchInfo()
        print(scores.count)
        return scores.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreCell
        cell.itemLabel.text = scores[indexPath.row].item
        cell.timeLabel.text = String(format: "%.1f", scores[indexPath.row].time)
        return cell
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
