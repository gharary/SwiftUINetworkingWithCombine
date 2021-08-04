//
//  Post.swift
//  NetworkingWithCombine
//
//  Created by Mohammad Gharari on 8/3/21.
//

import Foundation
struct Post: Decodable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
}
