//
//  HomeInteractor.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic {
    func fetch(request: HomeUseCases.Fetch.Request)
}

protocol HomeDataStore {
    //var name: String { get set }
}

enum NetworkError: Error {
    case domainError
    case decodingError
}

typealias AlbumsResponse = (Result<[Albums], NetworkError>) -> ()

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    // MARK: - Properties
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    //var name: String = ""
    
    // MARK: -
    func fetch(request: HomeUseCases.Fetch.Request) {
        worker = HomeWorker()
        worker?.fetchingData(completion: { albums in
            switch albums {
            case .success(let albums):
                let response = HomeUseCases.Fetch.Response(albums: albums)
                self.presenter?.presentResponse(response: response)
            case .failure:
                print("FAILED")
            }
        })
    }
}
