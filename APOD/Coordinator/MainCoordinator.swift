//
//  MainCoordinator.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {

    // MARK: - Properties
    var navigationController: UINavigationController

    // MARK: - Inits
    init(_ navigationController: UINavigationController) {
           self.navigationController = navigationController
       }

    // MARK: - Functions
    func start() {
        let apodListViewController = ApodListViewController.instantiate(from: .apodList)
        apodListViewController.initiate(with: [self])
        navigationController.pushViewController(apodListViewController, animated: true)
    }

    func presentDetail(of: Apod) {

    }


}
