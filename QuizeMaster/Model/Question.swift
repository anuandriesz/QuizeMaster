//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Anuradha Andriesz on 2024-04-15.
//  Copyright © 2024 The App Brewery. All rights reserved.
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
