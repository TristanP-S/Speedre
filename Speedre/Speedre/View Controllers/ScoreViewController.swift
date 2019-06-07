//
//  scoresVC.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
class ScoresViewController: UITableViewController{
    //sets # of items loaded in table view at once
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 20;
    }
    //sets up each cell in table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreCell
        //cell.itemLabel.text = insert item label here
        cell.numLabel.text = "\(indexPath.row)"
        //cell.timeLabel.text = insert timer label here
        return cell
    }
}
