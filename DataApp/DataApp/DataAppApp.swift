//
//  DataAppApp.swift
//  DataApp
//
//  Created by Tech on 2025-03-13.
//

import SwiftUI

@main
struct DataAppApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
