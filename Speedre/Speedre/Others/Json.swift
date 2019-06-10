//
//  Json.swift
//  Speedre
//
//  Created by Tristan Pudell-Spatscheck on 6/9/19.
//  Copyright © 2019 TAPS. All rights reserved.
//


//GLOBAL VARIABLES
//checks if camera just completed
var camera = false
//timer
var time = 0.0
//item in prompt
let item = ItemManager()
//results of checking photo taken
var result = "Item not checked"


//JSON PARSING STUFF
import Foundation

struct Results: Codable {
    let output: Output
    let id: String
}

struct Output: Codable {
    let captions: [Caption]
}

struct Caption: Codable {
    let caption: String
    let boundingBox: [Int]
    let confidence: Double
    
    enum CodingKeys: String, CodingKey {
        case caption
        case boundingBox = "bounding_box"
        case confidence
    }
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
