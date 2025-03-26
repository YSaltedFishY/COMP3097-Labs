//
//  ContentView.swift
//  LabPac1
//
//  Created by Guest1 on 2025-03-26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \LocationRecord.timestamp, ascending: false)]) private var records: FetchedResults<LocationRecord>
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            HStack{
                Button("Start"){
                    locationManager.startUpdating()
                }
                Button("Stop"){
                    locationManager.stopUpdating()
                }
            }
            List(records){
                record in
                Text("Lat: \(record.lat), Lon: \(record.lont), Time: \(record.timestamp!)")
            }
            
        }
        .onAppear{
            locationManager.onLocationUpdate = {
                location in
                let newRecord = LocationRecord(context: context)
                newRecord.timestamp = Date()
                newRecord.lat = location.coordinate.latitude
                newRecord.lont = location.coordinate.longitude
                
                print("Saved: \(newRecord.lat), \(newRecord.lont)")
                try? context.save()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
