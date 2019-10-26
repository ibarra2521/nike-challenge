//
//  Links.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import Foundation

struct Links: Codable {
    
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case ownself = "self"
        case alternate
    }
    
    // MARK: - Properties
    var ownself: String?
    var alternate: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ownself = try? container.decodeIfPresent(String.self, forKey: .ownself)
        alternate = try? container.decodeIfPresent(String.self, forKey: .alternate)
    }
}
