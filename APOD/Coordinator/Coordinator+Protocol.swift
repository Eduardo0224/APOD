//
//  Coordinator+Protocol.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

protocol Coordinator {

    // MARK: - Properties
    var navigationController: UINavigationController { get set }

    // MARK: - Protocol Functions
    func start()

    func presentDetail(of: Apod)
}
