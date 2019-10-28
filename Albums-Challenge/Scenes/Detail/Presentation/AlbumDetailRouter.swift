//
//  AlbumDetailRouter.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 26/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

protocol AlbumDetailDataPassing {
    var dataStore: AlbumDetailDataStore? { get }
}

class AlbumDetailRouter: NSObject, AlbumDetailDataPassing {
    
    // MARK: - Properties
    var dataStore: AlbumDetailDataStore?
}
