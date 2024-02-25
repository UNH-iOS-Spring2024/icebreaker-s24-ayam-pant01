//
//  Question.swift
//  IceBreaker-Pant-S24
//
//  Created by AP on 25/02/2024.
//

import Foundation

class Question{
    var id: String
    var text: String
    init?(id: String, data: [String: Any]) {
        guard let text = data["text"] as? String
        else{
            return nil
        }
        self.id = id
        self.text = text
    }
    
}
