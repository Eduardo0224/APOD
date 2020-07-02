//
//  Animator.swift
//  APOD
//
//  Created by Eduardo Andrade on 2/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

final class Animator {

    // MARK: - Properties
    private var hasAnimatedAllCells = false
    private let animation: AnimationTuple

    // MARK: - Inits
    init(animation: @escaping AnimationTuple) {
        self.animation = animation
    }

    // MARK: - Custom Functions
    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        guard !hasAnimatedAllCells else { return }
        animation(cell, indexPath, tableView)
        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
}
