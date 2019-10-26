//
//  Genres.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import Foundation

struct Genres: Codable {
    
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case genreId
        case url
        case name
    }
    
    // MARK: - Properties
    var genreId: String?
    var url: String?
    var name: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genreId = try? container.decodeIfPresent(String.self, forKey: .genreId)
        url = try? container.decodeIfPresent(String.self, forKey: .url)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
    }
}
