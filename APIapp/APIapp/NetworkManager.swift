//
//  NetworkManager.swift
//  APIapp
//
//  Created by Tech on 2025-03-20.
//

import Foundation

class NetworkManager: ObservableObject{
    @Published var todos:[ToDo] = []
    
    let address = "https://jsonplaceholder.typicode.com/todos"
    
    //
    func fetchAllTasks(completionHandler: @escaping ([ToDo])->Void){
        
        let url = URL(string: address)!
        
        let task = URLSession.shared.dataTask(with: url){
            (data, response,error) in
            
            if let error = error {
                print("Error while fetching data: \(error.localizedDescription)")
                completionHandler([])
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print ("Server side error fetching data :\(response?.description ?? "")")
                completionHandler([])
                return
            }
            
            if let data = data{
                let res = try? JSONDecoder().decode([ToDo].self, from: data)
                self.todos = res ?? []
                completionHandler(res ?? [])
            }
        }
        task.resume()
    }
    
    
    
}
