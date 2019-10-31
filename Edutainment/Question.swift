//
//  Question.swift
//  Edutainment
//
//  Created by Mario Alberto Barragán Espinosa on 31/10/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import Foundation

struct Question {
    var id: String
    var text: String
    var answer: String
}

struct QuestionBank {
    
    static let shared = QuestionBank()
    
    var questions = [Question]()
    
    private init() {
        for index in 1...12 {
            for number in 1...12 {
                let question = Question(id: "\(index)", text: "\(index) X \(number)", answer: "\(index * number)")
                questions.append(question)
            }
        }
    }
    
    func getQuestionsBy(id: String) -> [Question] {
        return questions.filter{ $0.id == id }
    }
}
