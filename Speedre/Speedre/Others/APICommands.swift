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
                //print(String(data: data!, encoding: .utf8)!)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    //checks imagae sent and scans it
    func checkImg(image: UIImage, word: String) -> Bool{
        let done = DispatchSemaphore(value: 0)
        let boundary = "------------------------5870595d8c958198"
        let imageData = image.jpegData(compressionQuality: 1.0)
        var body = Data()
        var decoded: Results = Results(output: Output(captions: [Caption(caption: "", boundingBox: [1], confidence: 1.0)]), id: "")
        body.append("\r\n--\(boundary)".data(using:.utf8)!)
        body.append("\r\nContent-Disposition: form-data; name=\"image\"; filename=\"xx.jpg\"\r\n".data(using:.utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using:.utf8)!)
        body.append(imageData!)
        body.append("\r\n--\(boundary)--\r\n".data(using:.utf8)!)
        print(imageData)
        // actual start of URL stuff
        let urlString = "https://api.deepai.org/api/densecap"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        while( APIkey == "" ) {
            sleep(1) // will hang here for ever unless you get an apikey
        }
        //adds api key to request
        request.addValue(APIkey, forHTTPHeaderField: "Api-Key")
        request.addValue("multipart/form-data; boundary=\(boundary)",forHTTPHeaderField: "Content-Type" )
        request.httpBody = body
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error
                return
            }
            do{
            //print(String(data: data!, encoding: .utf8)!)
            let decoder = JSONDecoder()
            decoded = try decoder.decode(Results.self, from: data!)
            done.signal()
            } catch {
                print(error)
            }
        }
        task.resume()
        done.wait()
        for caption in (decoded.output.captions) {
            if((caption.caption.contains(word))){
            print("y")
            return true;
            }
        }
        print("w")
        return false;
    }
}
