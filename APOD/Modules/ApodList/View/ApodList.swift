//
//  ApodListViewController.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ApodListViewController: UIViewController, Storyboarded {

    // MARK: - @IBOutlets & @IBActions
    @IBOutlet weak private var todayApodImageView: UIImageView!

    @IBOutlet weak var todayApodVideoView: YTPlayerView!
    @IBOutlet weak private var todayApodTitleLabel: UILabel!
    @IBOutlet weak private var apodTableView: UITableView!

    // MARK: - Properties
    /// ViewModel
    private(set) var viewModel = ApodListViewModel()
    private(set) var coordinator: Coordinator?
    private let loader = UIActivityIndicatorView(style: .medium)

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        registerUserTableViewCell()
        setupNavigationBar()
        getApodList {
            guard let todayApod = self.viewModel.todayApod else { return }
            self.todayApodTitleLabel.text = todayApod.title
            self.setupTodayApod(todayApod)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    // MARK: - Custom Functions
    private func configureTableView() {
        apodTableView.delegate = self
        apodTableView.dataSource = self
        apodTableView.keyboardDismissMode = .onDrag
        apodTableView.tableFooterView = UIView(frame: .zero)
        apodTableView.tableHeaderView = UIView(frame: .zero)
        apodTableView.separatorColor = .clear
    }

    private func setupVideoPlayer(from apod: Apod) {

        let videoId = apod.urlImage.split(separator: "/").last
        todayApodVideoView.load(withVideoId: String(videoId ?? ""), playerVars: ["playsinline" : 1,
                                                                                 "controls" : 0,
                                                                                 "fs" : 0,
                                                                                 "iv_load_policy" : 3,
                                                                                 "showinfo" : 0,
                                                                                 "modestbranding" : 0])
    }

    private func registerUserTableViewCell() {
        apodTableView.register(cell: Constants.apodCell, withId: Constants.apodCellId)
    }

    private func getApodList(_ onComplete: @escaping () -> Void) {
        show(indicator: loader)
        viewModel.getApodList(onComplete: { [weak self] in
            guard let self = self else { return }
            self.hide(indicator: self.loader)
            self.apodTableView.reloadData()
            onComplete()
        }) { error in
            self.hide(indicator: self.loader)
        }
    }

    func setupTodayApod(_ apod: Apod?) {
        guard let apod = apod else { return }
        switch apod.mediaType {
        case .image:
            todayApodVideoView.isHidden = true
            todayApodImageView.downloadImage(from: apod.urlImage)
        case .video:
            todayApodImageView.isHidden = true
            setupVideoPlayer(from: apod)
        }
    }
}

// MARK: - Constants
extension ApodListViewController {
    struct Constants {
        static let apodCell = "ApodTableViewCell"
        static let apodCellId = "ApodCellId"
    }
}

// MARK: - IDProtocol
extension ApodListViewController: InjectDependenciesProtocol {
    func initiate<T>(with dependencies: [T]) {
        dependencies.forEach { dependency in
            switch dependency {
            case let coordinator as MainCoordinator:
                self.coordinator = coordinator
            default:
                break
            }
        }
    }
}
