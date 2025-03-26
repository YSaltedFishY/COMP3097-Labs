//
//  LabPac1App.swift
//  LabPac1
//
//  Created by Guest1 on 2025-03-26.
//

import SwiftUI

@main
struct LabP1App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
