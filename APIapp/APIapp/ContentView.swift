//
//  ContentView.swift
//  APIapp
//
//  Created by Tech on 2025-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var nm = NetworkManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            
            List(nm.todos){
                todo in
                Text(todo.title)
            }.onAppear(){
                nm.fetchAllTasks(completionHandler: {
                    tasks in
                    print("got data")
                })
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
