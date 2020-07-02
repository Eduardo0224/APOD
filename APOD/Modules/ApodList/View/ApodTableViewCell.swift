//
//  ApodTableViewCell.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ApodTableViewCell: UITableViewCell {

    // MARK: - @IBOutlets & @IBActions
    @IBOutlet private weak var apodImageView: UIImageView!
    @IBOutlet private weak var apodVideoView: YTPlayerView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    // MARK: - Properties
    private var topColor: UIColor = UIColor.clear
    private var bottomColor: UIColor = UIColor.black.withAlphaComponent(0.8)

    // MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientLayer()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: .init(top: 6, left: 13, bottom: 6, right: 13))
    }

    // MARK: - Custom Functions
    func configure(with apod: Apod) {
        switch apod.mediaType {
        case .image:
            apodVideoView.isHidden = true
            downloadAPODImage(from: apod.urlImage)
        case .video:
            apodImageView.isHidden = true
            setupVideoPlayer(from: apod)
        }

        titleLabel.text = apod.title
        dateLabel.text = apod.date
    }
    
    private func downloadAPODImage(from urlString: String) {
        apodImageView.downloadImage(from: urlString)
    }

    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        let halfHeight = apodImageView.bounds.height / 2
        gradientLayer.frame = .init(x: 0, y: halfHeight, width: apodImageView.bounds.width, height: halfHeight)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.2, 0.5]
        apodImageView.layer.addSublayer(gradientLayer)
    }

    private func setupVideoPlayer(from apod: Apod) {
        let videoId = apod.urlImage.split(separator: "/").last
        apodVideoView.load(withVideoId: String(videoId ?? ""), playerVars: ["playsinline" : 1,
                                                                          "controls" : 0,
                                                                          "fs" : 0,
                                                                          "iv_load_policy" : 3,
                                                                          "showinfo" : 0,
                                                                          "modestbranding" : 0])
    }
}
