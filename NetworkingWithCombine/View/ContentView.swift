//
//  ContentView.swift
//  NetworkingWithCombine
//
//  Created by Mohammad Gharari on 8/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model:PostsViewModel
    
    init(model: PostsViewModel) {
        self.model = model
        model.fetchPosts()
    }
    var body: some View {
        
        return NavigationView {
            VStack {
                Text("Showing \(model.posts.count) Posts")
                List {
                    
                    ForEach(model.posts) { post in
                        NavigationLink(
                            destination: DetailView(id: post.id, model: model),
                            label: {
                                VStack (alignment:.leading) {
                                    Text("Title: \t \(post.title)")
                                        .multilineTextAlignment(.leading)
                                }
                            })
                        
                    }
                }
            }
        }
        
    }
}


struct DetailView: View {
    
    var id: Int
    var model: PostsViewModel
    
    init(id:Int,model:PostsViewModel) {
        self.id = id
        self.model = model
        model.fetchPost(id: id)
    }
    
    
    var body: some View {
        VStack (alignment:.leading) {
            Text("Title: \t \(model.singlePost!.title)")
                .multilineTextAlignment(.leading)
           Text("")
            Text("Body:\t\(model.singlePost!.body))")
        }.padding(.horizontal)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: PostsViewModel())
            .previewDevice("iPhone SE")
    }
}
