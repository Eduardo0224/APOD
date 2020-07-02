//
//  UIImageView+Downloading.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

extension UIImageView {

    // MARK: - Custom Functions
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        downloadImage(fromURL: url)
    }

    private func downloadImage(fromURL url: URL) {
        self.activityIndicator.startAnimating()
        self.image = nil
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                ApodAPI.callInMainThread { self.removeIndicator() }
            }
            if let data = data {
                ApodAPI.callInMainThread {
                    self.removeIndicator()
                    self.image = UIImage(data: data)
                    self.contentMode = .scaleAspectFill
                }
            }
            ApodAPI.callInMainThread { self.removeIndicator() }
        }.resume()
    }

    private var activityIndicator: UIActivityIndicatorView {
        if let indicator = self.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView { return indicator }
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        activityIndicator.stopAnimating()
        self.addSubview(activityIndicator)
        return activityIndicator
    }

    private func removeIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
