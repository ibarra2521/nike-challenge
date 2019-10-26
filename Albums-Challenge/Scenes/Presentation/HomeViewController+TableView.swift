//
//  HomeViewController+Extensions.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 26/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import UIKit

// MARK: - TableView
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setup(album: albums[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
