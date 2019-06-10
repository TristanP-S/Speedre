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
class ScoresViewController: UITableViewController{
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
    //sets # of items loaded in table view at once
    override func numberOfSections(in tableView: UITableView) -> Int {
        return scores.count;
    }
    //sets up each cell in table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fetchInfo()
        let cell=tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreCell
        cell.itemLabel.text = scores[indexPath.row].item
        cell.numLabel.text = "\(indexPath.row)"
        cell.timeLabel.text = scores[indexPath.row].item
        return cell
    }
}
