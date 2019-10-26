//
//  Response.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import Foundation

struct Response: Codable {
    
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case feed
    }
    
    // MARK: - Properties
    var feed: Feed?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        feed = try? container.decodeIfPresent(Feed.self, forKey: .feed)
    }
}
