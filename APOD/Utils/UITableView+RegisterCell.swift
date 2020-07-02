//
//  UITableView+RegisterCell.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

extension UITableView {
    // MARK: - Custom Functions
    func register(cell nib: String, withId id: String = "") {
        register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: id.isEmpty ? nib : id)
    }
}
