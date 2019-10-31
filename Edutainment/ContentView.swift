//
//  ContentView.swift
//  Edutainment
//
//  Created by Mario Alberto Barragán Espinosa on 31/10/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timesAmount = 1
    @State private var questionNumberIndex = 0
    @State private var questionOptions = ["5", "10", "All"]
    @State private var gameStarted = false
        
    var body: some View {
        Group {
            if !gameStarted {
                Form {
                    Section(header: Text("Game settings")) {
                        VStack(alignment: .leading) {
                            Text("Select multiplication table")
                                .font(.headline)
                            Stepper(value: $timesAmount, in: 1...12) {
                                Text("\(timesAmount)")
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("Number of questions")
                                .font(.headline)
                            Stepper(value: $questionNumberIndex, in: 0...questionOptions.count - 1) {
                                Text("\(questionOptions[questionNumberIndex])")
                            }
                        }
                    }
                    Section(header: Text("Game")) {
                        Button("Start Game"){
                            self.startGame()
                        }
                    }
                }
            } else {
                MainGameView(gameStarted: $gameStarted, numberOfQuestions: Int(questionOptions[questionNumberIndex]) ?? 12, questions: QuestionBank.shared.getQuestionsBy(id: "\(timesAmount)"))
            }
        }
    }
    
    func startGame() {
        self.gameStarted = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
