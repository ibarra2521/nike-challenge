//
//  HomeRouter.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
    func toDetail()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    // MARK: - Properties
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?

    func toDetail() {
        let destinationVC = AlbumDetailViewController()
        let destinationDS = destinationVC.routerDetail?.dataStore
        
        if let dataStore = dataStore, var destDataStore = destinationDS, let homeVC = viewController {
            passDataToDetail(source: dataStore, destination: &destDataStore)
            navigateToDetail(source: homeVC, destination: destinationVC)
        }
    }
    
    // MARK: - Navigation
    func navigateToDetail(source: HomeViewController, destination: AlbumDetailViewController) {
        source.show(destination, sender: nil)
    }

    // MARK: - Passing data
    func passDataToDetail(source: HomeDataStore, destination: inout AlbumDetailDataStore) {
        destination.album = source.album
    }
}
