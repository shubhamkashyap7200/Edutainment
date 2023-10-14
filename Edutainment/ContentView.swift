//
//  ContentView.swift
//  Edutainment
//
//  Created by Shubham on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    
    // Variable bindings
    @State private var selectedTable = 2
    @State private var selectedNumberOfQuestions = 1
    @FocusState private var isNumberOfQuestionsFocused: Bool
    @State var showModal: Bool = false

    // Contants
    let maxTableLimit = 12
    
    // computed properties
    var isStartButtonActive: Bool {
        return !(selectedNumberOfQuestions >= 1)
    }
    
    
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            Form {
                // MARK: Stepper Section to ask which table they want to choose
                Section {
                    Stepper("You selected table of \(selectedTable)", value: $selectedTable, in: 2...maxTableLimit, step: 1)
                } header: {
                    Text("Choose the table")
                }
                
                // MARK: Textfield for taking number of question input
                Section {
                    TextField("Number of questions", value: $selectedNumberOfQuestions, format: .number)
                        .keyboardType(.numberPad)
                        .focused($isNumberOfQuestionsFocused)
                } header: {
                    Text("Choose number of questions")
                }
                
                
                // MARK: Start the game
                Section {
                    HStack {
                        Spacer()
                        Button("Start the game") {
                            showModal = true
                            print("Pressed button")
                        }
                        .disabled(isStartButtonActive)
                        .fullScreenCover(isPresented: $showModal) {
                            // Passing the values to next view
                            GameMainView(selectedTable: selectedTable, selectedNumberOfQuestions: selectedNumberOfQuestions)
                        }
                        
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                }

            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done", role: .cancel) {
                        isNumberOfQuestionsFocused = false
                    }
                }
            })
            
            
            .navigationTitle("Edutainment")
        }
    }
}

#Preview {
    ContentView()
}




//Practise multiplication table

//Input in one screen then begin the game
// Stepper from 2 to 12
// then ask them how many questions they want to answer -- Maintain scores - Textfield


// Game begin with a top line showing progress and scores
// randomaly generating question like if 2 is selected "what is 2x8"
