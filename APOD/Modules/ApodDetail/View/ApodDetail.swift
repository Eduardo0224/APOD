//
//  ApodDetailViewController.swift
//  APOD
//
//  Created by Eduardo Andrade on 2/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ApodDetailViewController: UIViewController, Storyboarded {
    
    // MARK: - @IBOutlets & @IBActions
    @IBOutlet private weak var apodImageView: UIImageView!
    @IBOutlet private weak var apodVideoView: YTPlayerView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    private(set) var coordinator: Coordinator?
    private var apod: Apod?
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarDetail()
        guard let apod = self.apod else { return }
        setupApod(apod)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // MARK: - Custom Functions
    private func setupApod(_ apod: Apod) {
        titleLabel.text = apod.title
        dateLabel.text = apod.date
        descriptionLabel.text = apod.explanation
        switch apod.mediaType {
        case .image:
            apodVideoView.isHidden = true
            apodImageView.downloadImage(from: apod.urlImage)
        case .video:
            apodImageView.isHidden = true
            setupVideoPlayer(from: apod)
        }
    }
    
    private func setupVideoPlayer(from apod: Apod) {
        let videoId = apod.urlImage.split(separator: "/").last
        apodVideoView.load(withVideoId: String(videoId ?? ""))
    }
}

// MARK: - IDProtocol
extension ApodDetailViewController: InjectDependenciesProtocol {
    func initiate<T>(with dependencies: [T]) {
        dependencies.forEach { dependency in
            switch dependency {
            case let coordinator as MainCoordinator:
                self.coordinator = coordinator
            case let apod as Apod:
                self.apod = apod
            default:
                break
            }
        }
    }
}
