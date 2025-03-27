//
//  ContentView.swift
//  LabP2
//
//  Created by Guest1 on 2025-03-26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)
    var context
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Tempe.timestamp, ascending: false)])
    private var temps: FetchedResults<Tempe>
    
    var body: some View {
        VStack {
            Text("Temperature List:")
            List{
                ForEach(temps){
                    tem in
                    Text("Temp: \(tem.degree), TimeStamp: \(tem.timestamp!)")
                }
            }
        }
        .onAppear{
            recordTemperature()
        }
        .padding()
    }
    
    private func recordTemperature(){
        let newEntry = Tempe(context: context)
        newEntry.timestamp = Date()
        newEntry.degree = Double.random(in: -10...35)
        
        do{
            try context.save()
        }catch{
            print("Failed to save temperature: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
