//
//  AlbumDetailInteractor.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 26/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

protocol AlbumDetailDataStore {
    var album: Albums? { get set }
}

class AlbumDetailInteractor: AlbumDetailDataStore {
    
    // MARK: - Properties
    var album: Albums?
}
