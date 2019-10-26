//
//  HomePresenter.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentResponse(response: HomeUseCases.Fetch.Response)
}

class HomePresenter: HomePresentationLogic {
    
    // MARK: - Properties
    weak var viewController: HomeDisplayLogic?
    
    // MARK: -
    func presentResponse(response: HomeUseCases.Fetch.Response) {
        let viewModel = HomeUseCases.Fetch.ViewModel(albums: response.albums)
        viewController?.displayData(viewModel: viewModel)
    }    
}
