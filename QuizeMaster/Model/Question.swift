//
//  Question.swift
//  QuizeMaster
//
//  Created by Anuradha Andriesz on 2024-04-16.
//

import Foundation
struct Question {
    let text :String
    let answer: String
    
    init(q:String, a:String){
        text = q
        answer = a
    }
}
