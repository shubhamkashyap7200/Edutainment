//
//  GameMainView.swift
//  Edutainment
//
//  Created by Shubham on 10/15/23.
//

import SwiftUI

struct GameMainView: View {
    // MARK: Properties
    @Environment(\.dismiss) var dismiss
    @State private var currentScore = 0
    var randomMultiplierNumber: Int = Int.random(in: 1...10)
    let screenWidth = UIScreen.main.bounds.width
    
    // passed values
    var selectedTable: Int
    var selectedNumberOfQuestions: Int
    
    // computed properties
    var correctAnswer: Int {
        return selectedTable * randomMultiplierNumber
    }
    
    var arrayOfRandomAnswers: [Int] {
        var randomThreeNumberArray = (1...3).map( {_ in Int.random(in: selectedTable...selectedTable*10)} )
        randomThreeNumberArray.append(correctAnswer)
        return randomThreeNumberArray.shuffled()
    }
    
    
    
    // MARK: Body
    var body: some View {
        VStack {
            Color.green
                .frame(width: screenWidth / CGFloat(selectedNumberOfQuestions), height: 3.0)
                .offset(x: -screenWidth/2)
            
            HStack {
                Button("Quit") {
                    dismiss()
                }
                .font(.title3)
                .frame(width: 65, height: 30)
                .foregroundStyle(.white)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                
                Spacer()
                
                Text("Score: \(currentScore)")
            }
            .padding(.horizontal)
            
            Spacer()
            VStack(spacing: 60.0) {
                // Large title question
                Text("What is \(selectedTable)x\(randomMultiplierNumber) ?")
                    .font(.largeTitle.bold())
                
                // 4 Options Button
                VStack {
                    ForEach(arrayOfRandomAnswers, id: \.self) { num in
                        Button("A) \(num)") {}
                            .padding()
                            .frame(minWidth: 300, maxWidth: screenWidth - 60)
                            .font(.system(size: 20.0).weight(.medium))
                            .foregroundStyle(.white)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    GameMainView(selectedTable: 2, selectedNumberOfQuestions: 1)
}
