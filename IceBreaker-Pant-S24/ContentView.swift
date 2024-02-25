//
//  ContentView.swift
//  IceBreaker-Pant-S24
//
//  Created by AP on 24/02/2024.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    let db = Firestore.firestore()
    
    @State var txtFirstName: String = ""
    @State var txtLastName: String = ""
    @State var txtPrefName: String = ""
    @State var txtQuestion: String = ""
    @State var txtAnswer: String = ""
    @State var questions = [Question]()
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
        .onAppear(){
            getQuestionFromFirebase()
        }
    }
    
    func setRandomQuestion(){
        var newQuestion = questions.randomElement()?.text
        self.txtQuestion = newQuestion!
    }
    
    func getQuestionFromFirebase(){
        db.collection("questions")
            .getDocuments(){ (querySnapshot,err) in
                if let err = err { //if error is not null
                    print("Error getting documents: \(err)")
                } else{
                    // if we get data from firebase
                    for document in querySnapshot!.documents{
                        if let question = Question(id: document.documentID, data: document.data()){
                            self.questions.append(question)
                        }
                    }
                }
                    
                
            }
         
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
