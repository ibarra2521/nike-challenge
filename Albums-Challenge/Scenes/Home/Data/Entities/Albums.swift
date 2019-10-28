//
//  Albums.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import Foundation

struct Albums: Codable {
    
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case releaseDate
        case url
        case genres
        case kind
        case artworkUrl100
        case artistName
        case contentAdvisoryRating
        case artistId
        case artistUrl
        case copyright
        case name
        case id
    }
    
    // MARK: - Properties
    var releaseDate: String?
    var url: String?
    var genres: [Genres]?
    var kind: String?
    var artworkUrl100: String?
    var artistName: String?
    var contentAdvisoryRating: String?
    var artistId: String?
    var artistUrl: String?
    var copyright: String?
    var name: String?
    var id: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        releaseDate = try? container.decodeIfPresent(String.self, forKey: .releaseDate)
        url = try? container.decodeIfPresent(String.self, forKey: .url)
        genres = try? container.decodeIfPresent([Genres].self, forKey: .genres)
        kind = try? container.decodeIfPresent(String.self, forKey: .kind)
        artworkUrl100 = try? container.decodeIfPresent(String.self, forKey: .artworkUrl100)
        artistName = try? container.decodeIfPresent(String.self, forKey: .artistName)
        contentAdvisoryRating = try? container.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
        artistId = try? container.decodeIfPresent(String.self, forKey: .artistId)
        artistUrl = try? container.decodeIfPresent(String.self, forKey: .artistUrl)
        copyright = try? container.decodeIfPresent(String.self, forKey: .copyright)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        id = try? container.decodeIfPresent(String.self, forKey: .id)
    }
}
