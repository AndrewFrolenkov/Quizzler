//
//  File.swift
//  Quizzler
//
//  Created by Андрей Фроленков on 1.02.23.
//

import Foundation

struct Question {
    
    let text: String
    let variant: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.variant = a
        self.correctAnswer = correctAnswer
    }
}
