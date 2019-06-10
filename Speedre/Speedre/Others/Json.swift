//
//  Json.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/9/19.
//  Copyright © 2019 TAPS. All rights reserved.
//


//GLOBAL VARIABLES
//scores for tableview
var scores: [Score] = []
//checks if camera just completed
var camera = false
//timer
var time = 0.0
//item in prompt
var item = "Item"
//results of checking photo taken
var result = "Item not checked"


//JSON PARSING STUFF
import Foundation
//results returned after image is sent to API
struct Results: Decodable{
    let output: Output
}
struct Output: Decodable{
    let captions: [Captions]
}
struct Captions: Decodable{
    let caption: String
}
//api key encoding returned after reqeust
struct APIKeyDecode: Codable{
    let x: y
}
struct y: Codable{
    let y1: String
    let y2: String
    let y3: String
    let y4: String
}
