//
//  UIViewController+NavigationBar.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

extension UIViewController {

    // MARK: - Custom Functions
    func setupNavigationBar() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.view.backgroundColor = .clear
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}
