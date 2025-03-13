//
//  DataController.swift
//  DataApp
//
//  Created by Tech on 2025-03-13.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    
    let container = NSPersistentContainer(name: "MyData")
    
    init(){
        container.loadPersistentStores{
            description, error in
            
            if let error = error {
                print("Core Data failed to load \(error)")
            }
            
            
        }
    }
}
