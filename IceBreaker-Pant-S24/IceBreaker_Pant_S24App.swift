//
//  IceBreaker_Pant_S24App.swift
//  IceBreaker-Pant-S24
//
//  Created by AP on 24/02/2024.
//

import SwiftUI
import Firebase


@main
struct IceBreaker_Pant_S24App: App {
    init(){
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
