//
//  LabP2App.swift
//  LabP2
//
//  Created by Guest1 on 2025-03-26.
//

import SwiftUI

@main
struct LabP2App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
