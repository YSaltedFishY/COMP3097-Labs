//
//  DataController.swift
//  LabPac1
//
//  Created by Guest1 on 2025-03-26.
//

import Foundation
import CoreData

class DataController:ObservableObject {
    let container = NSPersistentContainer(name: "LocationData")
    
    init(){
        container.loadPersistentStores{
            description, error in
            
            if let error = error{
                print("Core Data failed to load \(error)")
            }
        }
    }
}
