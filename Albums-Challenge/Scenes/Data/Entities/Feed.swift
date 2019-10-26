//
//  Feed.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import Foundation

struct Feed: Codable {
    
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case updated
        case country
        case title
        case copyright
        case icon
        case author
        case results
        case id
        case links
    }
    
    // MARK: - Properties
    var updated: String?
    var country: String?
    var title: String?
    var copyright: String?
    var icon: String?
    var author: Author?
    var results: [Albums]?
    var id: String?
    var links: [Links]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        updated = try? container.decodeIfPresent(String.self, forKey: .updated)
        country = try? container.decodeIfPresent(String.self, forKey: .country)
        title = try? container.decodeIfPresent(String.self, forKey: .title)
        copyright = try? container.decodeIfPresent(String.self, forKey: .copyright)
        icon = try? container.decodeIfPresent(String.self, forKey: .icon)
        author = try? container.decodeIfPresent(Author.self, forKey: .author)
        results = try? container.decodeIfPresent([Albums].self, forKey: .results)
        id = try? container.decodeIfPresent(String.self, forKey: .id)
        links = try? container.decodeIfPresent([Links].self, forKey: .links)
    }
}
