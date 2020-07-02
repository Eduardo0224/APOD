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
    
    func setupNavigationBarDetail() {

        guard let navigationController = navigationController else { return }
        navigationController.view.backgroundColor = .black
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .black
        let navigationBarTitleTextAttributes: [NSAttributedString.Key : Any] = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ,
                                                                                .font : UIFont(name: "KohinoorBangla-Regular",
                                                                                               size: 25) as Any]
        navigationController.navigationBar.titleTextAttributes = navigationBarTitleTextAttributes
        navigationController.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController.navigationBar.shadowImage = UIImage()

        navigationItem.title = "APOD"
    }
}
