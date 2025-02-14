//
//  ContentView.swift
//  SwiftUINav
//
//  Created by HaoYun Yang on 2025-02-14.
//

import SwiftUI

struct Choice: Identifiable, Hashable{
    var id = UUID()
    let name :String
    
    func hash(into hasher: inout Hasher){
        hasher.combine(name)
    }
}

struct SecondScreen: View{
    var choice:String
    
    var body: some View{
        VStack{
            Text("Second screen \(choice)")
            NavigationLink(destination: Text("test")){
                Text("test")
            }
        }
    }
}

struct ContentView: View {
    let data = [
        Choice(name: "One"),
        Choice(name: "Two"),
        Choice(name: "Three")
    ]
    
    var body: some View {
        NavigationView{
            List(data){
                c in NavigationLink(destination: SecondScreen(choice: c.name)){
                    Text("test")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
