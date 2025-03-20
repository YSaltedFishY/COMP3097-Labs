//
//  ContentView.swift
//  APIapp
//
//  Created by Tech on 2025-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var nm = NetworkManager()
    @State var id = 0
    @State var task:ToDo? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            TextField("Id:", value: $id, formatter: NumberFormatter())
            Button("Get Task", action:{
                nm.fetchTask(with: id, completionHandler: {
                    task in
                    self.task = task
                    print("got data")
                })
            })
            Text(task?.title ?? "--")
            
            List(nm.todos){
                todo in
                Text(todo.title)
                    .listRowBackground(todo.completed ? Color.white : Color.red)
                
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
