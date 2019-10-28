//
//  AlbumCell.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 26/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    static let identifier = String(describing: AlbumCell.self)

    var albumImage: UIImage? {
        didSet {
            customImageView.image = albumImage
            setNeedsUpdateConstraints()
        }
    }

    var imageUrl: String? {
        didSet {
            if let imageUrl = imageUrl {
                customImageView.loadImageWithUrl(urlString: imageUrl)
            }
        }
    }
        
    private let customImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel
    let artistLabel: UILabel
    let artistValue: UILabel
    let k = Constants.self

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
        nameLabel.numberOfLines = k.zero
        artistValue.numberOfLines = k.zero
        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: k.priority1000), for: .vertical)
        artistLabel.setContentHuggingPriority(UILayoutPriority(rawValue: k.priority999), for: .vertical)
    }

    private func setupFonts() {
        nameLabel.font = UIFont.systemFont(ofSize: k.margin14, weight: .bold)
        artistLabel.font = UIFont.systemFont(ofSize: k.margin12, weight: .bold)
        artistValue.font = UIFont.systemFont(ofSize: k.margin12, weight: .light)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin10),
            customImageView.topAnchor.constraint(equalTo: topAnchor, constant: k.margin15),
            customImageView.heightAnchor.constraint(equalToConstant: k.margin50),
            customImageView.widthAnchor.constraint(equalToConstant: k.margin50),
            customImageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -k.margin08)])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: k.margin16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: k.margin16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -k.margin16)])

        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: k.margin16),
            artistLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: k.margin20)])

        NSLayoutConstraint.activate([
            artistValue.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: k.margin05),
            artistValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: k.margin16),
            artistValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -k.margin16),
            artistValue.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -k.margin16)])
    }
    
    func setup(album: Albums) {
        nameLabel.text = album.name
        artistValue.text = album.artistName
        imageUrl = album.artworkUrl100
    }
}
