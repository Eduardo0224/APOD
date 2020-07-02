//
//  InjectDependenciesProtocol.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import Foundation

// MARK: - InjectDependenciesProtocol
protocol InjectDependenciesProtocol {
    // MARK: - Functions
    func initiate<T>(with dependencies: [T])
}
