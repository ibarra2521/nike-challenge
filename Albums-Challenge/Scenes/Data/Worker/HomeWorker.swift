//
//  HomeWorker.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

class HomeWorker {
    func fetchingData(completion: @escaping AlbumsResponse) {
        NetworkManager.shared.getAlbums(completion: { albums in
            completion(albums)
        })
    }
}
