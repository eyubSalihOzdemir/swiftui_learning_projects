//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Salih Özdemir on 28.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingFinishAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var questionCounter = 0
    
    @State private var score = 0
     
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    struct FlagImage: View {
        var imageName: String
        
        var body: some View {
            Image(imageName)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5 )
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                 
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding( )
        }
        .alert(alertTitle, isPresented: $showingScore) {
            Button("Continue") {
                if questionCounter < 4 {
                    questionCounter += 1
                    askQuestion()
                } else {
                    showingFinishAlert = true
                }
            }
        } message: {
            Text(alertMessage)
        }
        .alert("End of game", isPresented: $showingFinishAlert) {
            Button("Restart") {
                score = 0
                questionCounter = 0
                
                askQuestion()
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            alertTitle = "Correct"
            alertMessage = "Good job. Your score is \(score)"
        } else {
            score -= 1
            alertTitle = "Wrong"
            alertMessage = "Wrong, that's the flag of \(countries[number]). Your score is \(score)"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func finishGame() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
