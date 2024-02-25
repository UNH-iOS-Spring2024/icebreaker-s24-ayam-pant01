//
//  ContentView.swift
//  IceBreaker-Pant-S24
//
//  Created by AP on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var txtFirstName: String = ""
    @State var txtLastName: String = ""
    @State var txtPrefName: String = ""
    @State var txtQuestion: String = "Test Question"
    @State var txtAnswer: String = ""
    var body: some View {
        VStack {
            Text("IceBreaker")
                .font(.system(size: 40)).bold()
            Text("Build with SwiftUI")
            TextField("First Name",text: $txtFirstName).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            TextField("Last Name",text:$txtLastName).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            TextField("Preferred Name",text:$txtPrefName).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Button(action: {
                setRandomQuestion()
            }){
                Text("Get a new random question")
                    .font(.system(size: 28))
            }
            Text(txtQuestion)
            TextField("Answer",text:$txtAnswer).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Button(action: {
                writeStudentsToFirebase()
            }){
                Text("Submit")
                    .font(.system(size: 28))
            }
            
        }
        .font(.largeTitle)
        .multilineTextAlignment(.center)
        .autocorrectionDisabled()
        .padding()
    }
    
    func setRandomQuestion(){
        print("btn pressed")
    }
    func writeStudentsToFirebase(){
        print("FirstName: \(txtFirstName)")
        print("LastName: \(txtLastName)")
        print("Pref Name: \(txtPrefName)")
        print("Question: \(txtQuestion)")
        print("Answer: \(txtAnswer)")
    }
}

#Preview {
    ContentView()
}
