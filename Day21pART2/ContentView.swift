//
//  ContentView.swift
//  Day21pART2
//
//  Created by Navjot Singh on 2020-05-02.
//  Copyright © 2020 Navjot Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var score:Int = 0
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack() {
                     Spacer()
                    Text("Tap the flag")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white).font(.largeTitle)
                        .fontWeight(.bold)
                }

                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                            .stroke(Color.black,lineWidth: 2))
                            .shadow(color: Color.black,radius: 2)
                    }
                }
                Spacer()
            }
        }.alert(isPresented: $showScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(self.score)"), dismissButton: .default(Text("Continue")) {
            self.askQuestion()
        })
        }
    }
    
    func flagTapped(_ number: Int){
        if number ==  correctAnswer{
            scoreTitle =  "Correct Answer"
            score += 1
        }else{
            scoreTitle = "Wrong"
            if score != 0{
              score -= 1
            }
        }
        
        showScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer  = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
