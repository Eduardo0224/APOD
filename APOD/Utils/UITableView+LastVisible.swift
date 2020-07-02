//
//  UITableView+LastVisible.swift
//  APOD
//
//  Created by Eduardo Andrade on 2/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

extension UITableView {
    // MARK: - Custom Functions
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}

