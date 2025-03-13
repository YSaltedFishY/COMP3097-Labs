//
//  ContentView.swift
//  DataApp
//
//  Created by Tech on 2025-03-13.
//

import SwiftUI

class RandomGenerator{
    static func userName()->String{
        let names = ["Mary","Sherry","Forest","Peter","HaoYun","Harry","Snape","Nata","Frank"]
        
        let id1 = Int.random(in: 0..<names.count)
        let id2 = Int.random(in: 0..<names.count)
        
        return "\(names[id1]) \(names[id2])"
    }
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext)
    var context
    
    @FetchRequest(sortDescriptors: [])
    var users:FetchedResults<User>
    
    
    
    var body: some View {
        VStack {
            
            Button(action: {
                let user = User(context: context)
                user.userName = RandomGenerator.userName()
                try? context.save()
            }, label: {Text("Add user")})
            
            List{
                ForEach(users, id: \.self){
                    u in
                    Text(u.userName ?? "-")
                }.onDelete(perform: {
                    offsets in
                    context.delete(users[offsets.first ?? 0])
                    try? context.save()
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
