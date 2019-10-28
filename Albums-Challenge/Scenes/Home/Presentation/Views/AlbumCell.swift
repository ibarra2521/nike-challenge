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
    let artistValue: UILabel
    
    var albumImage: UIImage? {
        didSet {
            customImageView.image = albumImage
            setNeedsUpdateConstraints()
        }
    }
    
    private let customImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var imageUrl: String? {
        didSet {
            if let imageUrl = imageUrl {
                customImageView.loadImageWithUrl(urlString: imageUrl)
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        nameLabel = UILabel()
        artistLabel = UILabel()
        artistValue = UILabel()
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
        customImageView.clipsToBounds = true
        customImageView.contentMode = .scaleAspectFill
        customImageView.image = UIImage(named: "album")

        artistLabel.text = "Artist: "
        contentView.addSubviewForAutoLayout(customImageView)
        contentView.addSubviewForAutoLayout(nameLabel)
        contentView.addSubviewForAutoLayout(artistLabel)
        contentView.addSubviewForAutoLayout(artistValue)
        nameLabel.numberOfLines = 0
        artistValue.numberOfLines = 0
        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        artistLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 999), for: .vertical)
    }

    private func setupFonts() {
        nameLabel.font = UIFont.systemFont(ofSize: Constants.nameFontSize, weight: .bold)
        artistLabel.font = UIFont.systemFont(ofSize: Constants.artistFontSize, weight: .bold)
        artistValue.font = UIFont.systemFont(ofSize: Constants.artistFontSize, weight: .light)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            customImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            customImageView.heightAnchor.constraint(equalToConstant: 50),
            customImageView.widthAnchor.constraint(equalToConstant: 50),
            customImageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -8)])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: Constants.margin),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.margin),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.margin)])

        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.margin),
            artistLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)])

        NSLayoutConstraint.activate([
            artistValue.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: 5),
            artistValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.margin),
            artistValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.margin),
            artistValue.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.margin)])
    }
    
    func setup(album: Albums) {
        nameLabel.text = album.name
        artistValue.text = album.artistName
        imageUrl = album.artworkUrl100
    }
}
