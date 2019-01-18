//
//  Quiz.swift
//  App1
//
//  Created by Emily-Khine Chu on 9/25/18.
//  Copyright © 2018 Emily-Khine Chu. All rights reserved.
//

import Foundation

class Question:Codable {
    var question: String?
    var answer: [String]?
    var correctAnswerIndex:Int?
    var feedback:String?
    
}



