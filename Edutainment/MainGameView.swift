//
//  MainGameView.swift
//  Edutainment
//
//  Created by Mario Alberto Barragán Espinosa on 31/10/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct MainGameView: View {
    
    @Binding var gameStarted: Bool
    var numberOfQuestions: Int
    @State var questions: [Question]
    
    @State private var answer = ""
    @State private var currentQuestion = Int.random(in: 0...11)
    @State private var currentQuestionIndex = 0
    @State private var currentScore = 0
        
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("\(questions[currentQuestion].text)")
                .font(.largeTitle)
                .padding(50)
            Text("Question: \(currentQuestionIndex)")
            Text("Current score: \(currentScore)")
            TextField("Type your answer...", text: $answer)
                .padding(50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Button("Submit") {
                self.checkAnswer(answer: self.answer)
            }.padding()
            Spacer()
        }
    }
    
    func checkAnswer(answer: String) {
        if answer == questions[currentQuestion].answer {
            // TODO: Add animation when answer is right
            currentScore += 1
        } else {
            // TODO: Add animation when answer is wrong
            currentScore -= 1
        }
        questions.remove(at: currentQuestion)
        if !questions.isEmpty {
            currentQuestion = Int.random(in: 0...questions.count - 1)
        }
        currentQuestionIndex += 1
        self.answer = ""
        if currentQuestionIndex == numberOfQuestions {
             gameStarted = false
             return
         }
    }
}

struct MainGameView_Previews: PreviewProvider {
    @State static var gameStarted = true
    static var previews: some View {
        MainGameView(gameStarted: $gameStarted, numberOfQuestions: 1, questions: QuestionBank.shared.questions)
    }
}
