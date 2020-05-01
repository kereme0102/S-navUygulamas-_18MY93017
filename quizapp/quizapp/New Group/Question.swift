//
//  Question.swift
//  quizapp
//
//  Created by YilmazC on 24.03.2020.
//  Copyright © 2020 YilmazC. All rights reserved.
//

import Foundation


class Question {
    
    var questiontext: String
    var answer : Bool
    
    init(questiontext:String, answer:Bool) {
        
        self.questiontext = questiontext
        self.answer = answer
    }
    
}


