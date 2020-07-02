//
//  StoryboardedProtocol.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

// MARK: - Enums
enum StoryboardName: String {
    case apodList = "ApodList"
    case apodDetail = "ApodDetail"
}

// MARK: - Protocol
protocol Storyboarded {
    static func instantiate(from storyboardName: StoryboardName) -> Self
}

// MARK: - Protocol Extension
extension Storyboarded where Self: UIViewController {
    // MARK: - Protocol Functions
    static func instantiate(from storyboardName: StoryboardName) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
