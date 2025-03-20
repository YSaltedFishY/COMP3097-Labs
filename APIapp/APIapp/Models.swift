//
//  Models.swift
//  APIapp
//
//  Created by Tech on 2025-03-20.
//

import Foundation

struct ToDo: Codable, Identifiable{
        let userId:Int
        let id: Int
        let title: String
        let completed: Bool

//    let CodeKeys:CodingKeys, String{
//        case userId="user_id"
//        case id
//        case title
//        case completed
//    }
}
