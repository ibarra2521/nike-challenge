//
//  AlbumDetailViewController+extensions.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 28/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import UIKit

// MARK: - Extensions
extension AlbumDetailViewController {
    
    // MARK: - Initialize
    func initialize() {
        setupDetailView()
        updateViews()
        setupConstraints()
    }
    
    private func setupDetailView() {
        title = "Detail Album"
        view.backgroundColor = .lightGray
        view.addSubviewForAutoLayout(detailView)
    }
    
    private func updateViews() {
        if let album = routerDetail?.dataStore?.album {
            var image = UIImage(named: "album")
            if let cachedImage = ImageCache.shared.getImage(forKey: album.artworkUrl100 ?? String()) {
                image = cachedImage
            }
            detailView.setupAlbum(album: album, image: image)
        }
    }
    
    private func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            detailView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            detailView.topAnchor.constraint(equalTo: guide.topAnchor),
            detailView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)])
    }
}
