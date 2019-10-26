//
//  AlbumCell.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 26/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    private struct Constants {
        static let margin: CGFloat = 16
        static let nameFontSize: CGFloat = 14
        static let artistFontSize: CGFloat = 12
    }
    
    static let identifier = String(describing: AlbumCell.self)
    let nameLabel: UILabel
    let artistLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        nameLabel = UILabel()
        artistLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        setupUIControls()
        setupFonts()
        setupConstraints()

    }
    
    private func setupUIControls() {
        contentView.addSubviewForAutoLayout(nameLabel)
        contentView.addSubviewForAutoLayout(artistLabel)
        nameLabel.numberOfLines = 0
        artistLabel.numberOfLines = 0
        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        artistLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 999), for: .vertical)
    }

    private func setupFonts() {
        nameLabel.font = UIFont.systemFont(ofSize: Constants.nameFontSize, weight: .bold)
        artistLabel.font = UIFont.systemFont(ofSize: Constants.artistFontSize, weight: .light)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.margin),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.margin),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.margin)])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.margin),
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.margin),
            artistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.margin),
            artistLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.margin)])
    }
    
    func setup(album: Albums) {
        nameLabel.text = album.name
        artistLabel.text = album.artistName
    }
}
