//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Salih Özdemir on 5.03.2023.
//

import SwiftUI

enum Moves: String,CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    var opposite: Moves {
        switch(self) {
        case .rock: return Moves.paper
        case .paper: return Moves.scissors
        case .scissors: return Moves.rock
        }
    }
}

struct ContentView: View {
    @State private var computersMove = Moves.allCases.randomElement()
    @State private var playerShouldWin = Bool.random()
    @State private var score = 0
    @State private var answer: Bool = false {
        didSet {
            answer ? (score += 1) : (score -= 1)
        }
    }
    
    @State private var showingAlert = false
    
    var alertTitle: String {
        answer ? "Correct move!" : "That was wrong!"
    }
    var alertMessage: String {
        answer ? "Congrats." : "try again."
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(colors: [Color(red: 240/255, green: 226/255, blue: 231/255), Color(red: 178/255.0, green: 76/255.0, blue: 99/255.0)], center: .top, startRadius: 450, endRadius: 900)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("Computer chose")
                        Text(computersMove?.rawValue ?? "Error!")
                            .font(.largeTitle)
                        Text("and you should...")
                        Text(playerShouldWin ? "Win" : "Lose")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Button("Rock") {
                            checkMove(move: .rock)
                        }
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.init(red: 50/255, green: 2/255, blue: 31/255))

                        Button("Paper") {
                            checkMove(move: .paper)
                        }
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.init(red: 50/255, green: 2/255, blue: 31/255))

                        Button("Scissors") {
                            checkMove(move: .scissors)
                        }
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.init(red: 50/255, green: 2/255, blue: 31/255))
                    }
                    
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Text("Score: \(score)")
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Reset Game") {
                            score = 0
                            askQuestion()
                        }
                    }
                }
            }
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") {
                askQuestion()
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    func askQuestion() {
        withAnimation {
            computersMove = Moves.allCases.randomElement()
            playerShouldWin.toggle()
        }
    }
    
    func checkMove(move: Moves) {
        if let oppositeMove = computersMove?.opposite {
            if playerShouldWin {
                // move should be opposite of the computersMove
                if move == oppositeMove {
                    answer = true
                } else {
                    answer = false
                }
            } else {
                // player should lose, the move should NOT be opposite of the computersMove
                if move == oppositeMove {
                    answer = false
                } else {
                    answer = true
                }
            }
        }
        
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
