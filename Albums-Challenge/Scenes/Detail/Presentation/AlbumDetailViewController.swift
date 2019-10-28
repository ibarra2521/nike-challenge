//
//  AlbumDetailViewController.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 26/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    // MARK: - Properties
    var routerDetail: (NSObjectProtocol & AlbumDetailDataPassing)?
    let detailView = DetailView()
        
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = AlbumDetailInteractor()
        let router = AlbumDetailRouter()
        viewController.routerDetail = router
        router.dataStore = interactor
    }
        
    // MARK: - View lifecycle    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }    
}
