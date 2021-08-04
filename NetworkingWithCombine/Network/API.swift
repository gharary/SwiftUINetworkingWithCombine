//
//  API.swift
//  NetworkingWithCombine
//
//  Created by Mohammad Gharari on 8/3/21.
//

import SwiftUI
import Combine

struct API {
    /// API Errors
    enum Error: LocalizedError, Identifiable {
        var id: String { localizedDescription }
        
        case addressUnreachable(URL)
        case invalidResponse
        
        var errorDescription: String? {
            switch self {
            case .invalidResponse: return "The server responded wrongly!"
            case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable"
            }
        }
    }
    
    enum EndPoint {
        static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
        case posts
        case post(Int)
        
        var url:URL {
            switch self {
            case .posts:
                return EndPoint.baseURL.appendingPathComponent("posts")
            case .post(let id):
                return EndPoint.baseURL.appendingPathComponent("posts/\(id)")
            }
        }
    }
    
    private let decoder = JSONDecoder()
    
    private let apiQueue = DispatchQueue(label: "API",qos: .default,attributes: .concurrent)
    
    // API
    func post(id:Int) -> AnyPublisher<Post,Error> {
        URLSession.shared.dataTaskPublisher(for: EndPoint.post(id).url)
            .receive(on: apiQueue)
            .map { $0.0 }
            .decode(type: Post.self, decoder: decoder)
            .catch { _ in Empty() }
            .eraseToAnyPublisher()
    }
    
    func posts() -> AnyPublisher<[Post],Error> {
        URLSession.shared.dataTaskPublisher(for: EndPoint.posts.url)
            .receive(on: apiQueue)
            .map { $0.data }
            .decode(type: [Post].self, decoder: decoder)
            .mapError { error in
                switch error {
                case is URLError:
                    return Error.addressUnreachable(EndPoint.posts.url)
                default: return Error.invalidResponse
                }
            }
            .filter { !$0.isEmpty }
            .eraseToAnyPublisher()
    }
}
