//
//  HomeViewController.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 25/10/19.
//  Copyright (c) 2019 Nick iOS. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
    func displayData(viewModel: HomeUseCases.Fetch.ViewModel)
    func displayAlbumDetail(viewModel: HomeUseCases.Detail.ViewModel)
}

struct Constant {
    
    // MARK: - Struct for default values
    struct Defautl {
        static let rowHeight: CGFloat = 300.0
    }
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    
    // MARK: - Properties
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    var albums = [Albums]()
    let albumView = AlbumView()
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    override func loadView() {
        view = albumView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Extensions
extension HomeViewController {

    // MARK: - Initialize
    private func initialize() {
        loadData()
        setupTableView()
        title = "Albums"
    }
    
    // MARK: - Setup TableView
    private func setupTableView() {
        albumView.tableView.rowHeight = UITableView.automaticDimension
        albumView.tableView.estimatedRowHeight = Constant.Defautl.rowHeight
        albumView.tableView.tableFooterView = UIView(frame: .zero)
        albumView.tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.identifier)
        albumView.tableView.dataSource = self
        albumView.tableView.delegate = self
    }
    
    // MARK: -
    func loadData() {
        let request = HomeUseCases.Fetch.Request()
        interactor?.fetch(request: request)
    }

    // MARK: - Implemented HomeDisplayLogic protocol
    func displayData(viewModel: HomeUseCases.Fetch.ViewModel) {
        albums = []
        albums = viewModel.albums
        albumView.tableView.reloadData()
    }
    
    func displayAlbumDetail(viewModel: HomeUseCases.Detail.ViewModel) {
        router?.toDetail()
    }
}
