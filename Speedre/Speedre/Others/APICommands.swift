//
//  APICommands.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/6/19.
//  Copyright © 2019 TAPS. All rights reserved.
//
import UIKit
import Foundation
var APIkey: String =  "noAPIkey"
class APICommands{
    //fucntion that gets the APIkey 
    init(userID: String){
    let urlString = "http://www.spatscheck.com/gehajbr9t14hdfildhuqhjq3.json?\(userID)"
    let url = URL(string: urlString)
    let request = URLRequest(url: url!)
    let session = URLSession.shared
    let task = session.dataTask(with: request) { data, response, error in
        if error != nil { // Handle error
            return
        }
        do{
        let decoder = JSONDecoder()
        var decoded = try decoder.decode(APIKeyDecode.self, from: data!)
        APIkey = "\(decoded.x.y2)-\(decoded.x.y3)-4855-\(decoded.x.y1)-\(decoded.x.y4)"
        print(String(data: data!, encoding: .utf8)!)
        }
        catch{
            print(error)
        }
        }
    task.resume()
    }
    //checks imagae sent and scans it
    func checkImg(image: UIImage, word: String) -> Bool{
        let postString = "image=\(image)"
        let urlString = "https://api.deepai.org/api/densecap"
        let url = URL(string: urlString)
        //will wait until API Key has been decoded before making a request
        while(APIkey == "noAPIkey"){
            sleep(1)
        }
        var request = URLRequest(url: url!)
        //adds api key to request
        request.addValue(APIkey, forHTTPHeaderField: "Api-Key")
        request.httpMethod = "POST"
        //adds image to request
        request.httpBody = postString.data(using:.utf8)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error
                return
            }
            print(String(data: data!, encoding: .utf8)!)
        }
        task.resume()
        return true;
    }
}
