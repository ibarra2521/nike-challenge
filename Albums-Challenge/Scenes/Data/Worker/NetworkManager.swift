//
//  NetworkManager.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
    
    func getAlbums(completion: @escaping AlbumsResponse) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.decodingError))
            return
        }
        Loading.start()
        let  dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                Loading.stop()
                guard let data = data else {
                    completion(.failure(.decodingError))
                    return
                }
                do {
                    guard let resp = try? JSONDecoder().decode(Response.self, from: data), let albums = resp.feed?.results else {
                        completion(.failure(.decodingError))
                        return
                    }
                    completion(.success(albums))
                }
            }
        }
        dataTask.resume()
    }
}
