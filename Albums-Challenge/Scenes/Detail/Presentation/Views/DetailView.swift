//
//  DetailView.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 26/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
            setNeedsUpdateConstraints()
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var artist: String? {
        didSet {
            artistValue.text = artist
        }
    }
    
    var genre: String? {
        didSet {
            genreValue.text = genre
        }
    }

    var release: String? {
        didSet {
            releaseValue.text = release
        }
    }
    
    var copyRight: String? {
        didSet {
            copyRightValue.text = copyRight
        }
    }
    
    var itunesUrl: String? {
        didSet {
            itunesUrlValue = itunesUrl ?? String()
        }
    }

    fileprivate let imageView = CustomImageView()
    fileprivate let titleLabel = UILabel()
    fileprivate let artistLabel = UILabel()
    fileprivate let artistValue = UILabel()
    fileprivate let genreLabel = UILabel()
    fileprivate let genreValue = UILabel()
    fileprivate let releaseLabel = UILabel()
    fileprivate let releaseValue = UILabel()
    fileprivate let copyRightLabel = UILabel()
    fileprivate let copyRightValue = UILabel()
    fileprivate var itunesUrlValue = String()
    fileprivate var openButton = UIButton()
    fileprivate let k = Constants.self
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: k.height100)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setup()
        setupConstraints()
    }
    
    func setup() {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        titleLabel.numberOfLines = k.zero
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: k.size24, weight: .bold)
        
        artistLabel.text = "Artist: "
        artistLabel.font = UIFont.systemFont(ofSize: k.size16, weight: .bold)
        artistValue.numberOfLines = k.zero

        genreLabel.text = "Genre: "
        genreLabel.font = UIFont.systemFont(ofSize: k.size16, weight: .bold)
        genreValue.numberOfLines = k.zero
        
        releaseLabel.text = "Release Date: "
        releaseLabel.font = UIFont.systemFont(ofSize: k.size16, weight: .bold)
        releaseValue.numberOfLines = k.zero

        copyRightLabel.text = "Copyright: "
        copyRightLabel.font = UIFont.systemFont(ofSize: k.size16, weight: .bold)
        copyRightValue.numberOfLines = k.zero
        
        openButton = UIButton(type: .roundedRect)
        customButton()
        
        addSubviewForAutoLayout(imageView)
        addSubviewForAutoLayout(titleLabel)
        addSubviewForAutoLayout(artistLabel)
        addSubviewForAutoLayout(artistValue)
        addSubviewForAutoLayout(genreLabel)
        addSubviewForAutoLayout(genreValue)
        addSubviewForAutoLayout(releaseLabel)
        addSubviewForAutoLayout(releaseValue)
        addSubviewForAutoLayout(copyRightLabel)
        addSubviewForAutoLayout(copyRightValue)
        addSubviewForAutoLayout(openButton)
    }
    
    
    func customButton() {
        openButton.setTitle("Open Itunes store", for: .normal)
        openButton.titleLabel?.lineBreakMode = .byWordWrapping
        openButton.titleLabel?.textAlignment = .center
        openButton.setTitleColor(UIColor.white, for: .normal)
        openButton.layer.cornerRadius = k.corner6
        openButton.backgroundColor = UIColor.orange.withAlphaComponent(k.alpha06)
        openButton.tintColor = UIColor.brown
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (tap))
        openButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func tap() {
        if let url = URL(string: itunesUrlValue) {
            UIApplication.shared.open(url)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: k.margin20),
            imageView.heightAnchor.constraint(equalToConstant: k.height250),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -k.margin20)])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: k.margin00),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -k.margin20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: k.margin15),
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            artistLabel.trailingAnchor.constraint(equalTo: artistValue.leadingAnchor, constant: -k.margin08)])
        
        NSLayoutConstraint.activate([
            artistValue.firstBaselineAnchor.constraint(equalTo: artistLabel.firstBaselineAnchor),
            artistValue.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor),
            artistValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -k.margin20)])

        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: artistValue.bottomAnchor, constant: k.margin15),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            genreLabel.trailingAnchor.constraint(equalTo: genreValue.leadingAnchor, constant: -k.margin08)])
        
        NSLayoutConstraint.activate([
            genreValue.firstBaselineAnchor.constraint(equalTo: genreLabel.firstBaselineAnchor),
            genreValue.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor),
            genreValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -k.margin20)])

        NSLayoutConstraint.activate([
            releaseLabel.topAnchor.constraint(equalTo: genreValue.bottomAnchor, constant: k.margin15),
            releaseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            releaseLabel.trailingAnchor.constraint(equalTo: releaseValue.leadingAnchor, constant: -k.margin08)])
        
        NSLayoutConstraint.activate([
            releaseValue.firstBaselineAnchor.constraint(equalTo: releaseLabel.firstBaselineAnchor),
            releaseValue.leadingAnchor.constraint(equalTo: releaseLabel.trailingAnchor),
            releaseValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -k.margin20)])

        NSLayoutConstraint.activate([
            copyRightLabel.topAnchor.constraint(equalTo: releaseValue.bottomAnchor, constant: k.margin15),
            copyRightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            copyRightLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: k.margin50),
            copyRightLabel.trailingAnchor.constraint(equalTo: copyRightValue.leadingAnchor, constant: -k.margin08)])
        
        NSLayoutConstraint.activate([
            copyRightValue.firstBaselineAnchor.constraint(equalTo: copyRightLabel.firstBaselineAnchor),
            copyRightValue.leadingAnchor.constraint(equalTo: copyRightLabel.trailingAnchor),
            copyRightValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -k.margin20)])
        
        NSLayoutConstraint.activate([
            openButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            openButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: k.margin20),
            openButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openButton.heightAnchor.constraint(equalToConstant: k.margin40),
            openButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -k.margin20)])
    }
    
    func setupAlbum(album: Albums, image: UIImage?) {
        if let cacheImage = image {
            imageView.image = cacheImage
        } else {
            imageView.loadImageWithUrl(urlString: album.artworkUrl100 ?? String())
        }
        title = album.name
        artist = album.artistName
        genre = getGenres(genres: album.genres)
        release = album.releaseDate
        copyRight = album.copyright
        itunesUrl = album.url
    }
    
    private func getGenres(genres: [Genres]?) -> String {
        guard let genres = genres else { return String() }
        var allGenres = String()
        genres.forEach { genre in
            allGenres = allGenres + "\(genre.name ?? String()) "
        }
        return allGenres
    }
}
