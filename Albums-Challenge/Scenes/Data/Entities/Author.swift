//
//  Author.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import Foundation

struct Author: Codable {
    
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case name
        case uri
    }
    
    // MARK: - Properties
    var name: String?
    var uri: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        uri = try? container.decodeIfPresent(String.self, forKey: .uri)
    }
}
