//
//  Enums.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

// MARK: - Enums
enum Format: String {
    case apodDate = "yyyy-MM-dd"
}

typealias AnimationTuple = (UITableViewCell, IndexPath, UITableView) -> Void

enum Animation {

    // MARK: - Custom Functions
    static func moveWithFade(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> AnimationTuple {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
            cell.alpha = 0

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            })
        }
    }
}
