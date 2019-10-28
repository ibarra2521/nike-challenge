//
//  CustomImageView.swift
//  Albums-Challenge
//
//  Created by Nick Ibarra on 28/10/19.
//  Copyright © 2019 Nick iOS. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    private var currentTask: URLSessionTask?
    var imageUrlString: String?
    
    func loadImageWithUrl(urlString: String) {
        weak var oldTask = currentTask
        currentTask = nil
        oldTask?.cancel()
        imageUrlString = urlString
        image = nil
        if let cachedImage = ImageCache.shared.getImage(forKey: urlString) {
            image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let _ = error { return }
                if let unwrappedData = data, let downloadedImage = UIImage(data: unwrappedData) {
                    DispatchQueue.main.async(execute: {
                        ImageCache.shared.save(image: downloadedImage, forKey: urlString)
                        if self.imageUrlString == urlString {
                            self.image = downloadedImage
                        }
                    })
                }                
            }
            currentTask = dataTask
            dataTask.resume()
        }
    }
}
