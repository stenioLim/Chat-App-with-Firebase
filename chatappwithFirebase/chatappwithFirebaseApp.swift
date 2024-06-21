//
//  chatappwithFirebaseApp.swift
//  chatappwithFirebase
//
//  Created by stenio Lima on 20/06/24.
//

import SwiftUI
import Firebase

@main
struct chatappwithFirebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
