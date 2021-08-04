//
//  NetworkingWithCombineApp.swift
//  NetworkingWithCombine
//
//  Created by Mohammad Gharari on 8/3/21.
//

import SwiftUI

@main
struct NetworkingWithCombineApp: App {
    let model = PostsViewModel()
    
    init() {
        model.fetchPosts()
    }
    
    
    
    var body: some Scene {
        
        
        WindowGroup {
            ContentView(model: model)
            
        }
    }
}
