//
//  HomeUseCases.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

enum HomeUseCases {
    
    // MARK: - Use cases
    enum Fetch {
        
        struct Request { }
        
        struct Response {
            let albums: [Albums]
        }
        
        struct ViewModel {
            let albums: [Albums]
        }
    }
}
