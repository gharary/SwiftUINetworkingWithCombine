//
//  PostsViewModel.swift
//  NetworkingWithCombine
//
//  Created by Mohammad Gharari on 8/3/21.
//

import Foundation
import Combine
import SwiftUI

class PostsViewModel: ObservableObject {
    // MARK: Properties
    private let api = API()
    private var subscription = Set<AnyCancellable>()
    
    // MARK: Publishers
    @Published private var allPosts = [Post]()
    @Published var error: API.Error? = nil
    
    // MARK: values
    var posts:[Post] {
        return allPosts
    }
    
    var singlePost: Post?
    func fetchPosts() {
        api
            .posts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            } receiveValue: { posts in
                self.allPosts = posts
                self.error = nil
            }
            .store(in: &subscription)

    }
    
    func fetchPost(id: Int) {
        api
            .post(id: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            } receiveValue: { post in
                self.singlePost = post
                self.error = nil
            }
            .store(in: &subscription)

    }
}
