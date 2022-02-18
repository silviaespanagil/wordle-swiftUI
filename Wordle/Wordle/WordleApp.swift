//
//  WordleApp.swift
//  Wordle
//
//  Created by Silvia España on 17/2/22.
//

import SwiftUI

@main
struct WordleApp: App {
    @StateObject var dataModel = WordleDataModel()
    
    var body: some Scene {
        
        WindowGroup {
            
            GameView()
                .environmentObject(dataModel)
        }
    }
}
