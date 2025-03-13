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
    
    static func title()->String{
        let titles = ["Do andorids dream of electric sheep","Frankeinstin's monster","Run Forest run","Peter Pan","Harry potter and the magical swift","Yesterday once more","Taming flame","The elephant","Batman Issue 1974"]
        
        let id1 = Int.random(in: 0..<titles.count)
        
        return "\(titles[id1])"
    }
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext)
    var context
    
    @FetchRequest(sortDescriptors: [])
    var users:FetchedResults<User>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "author.userName", ascending: true)])
    var posts:FetchedResults<Post>
    
    var body: some View {
        VStack {
            
            HStack{
                Button(action: {
                    let user = User(context: context)
                    user.userName = RandomGenerator.userName()
                    try? context.save()
                }, label: {Text("Add user")})
                
                Button(action: {
                    let post = Post(context: context)
                    post.title = RandomGenerator.title()
                    try? context.save()
                }, label: {Text("Add title")})
            }
            
            Text("Users:")
            List{
                ForEach(users, id: \.self){
                    u in
                    Text(u.userName ?? "-").onTapGesture{
                        let post = Post(context: context)
                        post.title = RandomGenerator.title()
                        post.author = u
                        try? context.save()
                    }
                }.onDelete(perform: {
                    offsets in
                    context.delete(users[offsets.first ?? 0])
                    try? context.save()
                })
            }
            
            Text("Posts:")
            List{
                ForEach(posts, id: \.self){
                    p in
                    HStack{
                        Text(p.title ?? "-")
                        Text(p.author?.userName ?? "-")
                    }
                }.onDelete(perform:{
                    offsets in
                    context.delete(posts[offsets.first ?? 0])
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
