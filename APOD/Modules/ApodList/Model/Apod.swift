//
//  Apod.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import Foundation

// MARK: - Structs
enum MediaType: String, Codable {
    case image
    case video
}

struct Apod: Codable {

    // MARK: - Properties
    let copyright, urlImageHD: String?
    let date, explanation, serviceVersion, title, urlImage: String
    let mediaType: MediaType

    // MARK: - Enums
    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case urlImageHD = "hdurl"
        case urlImage = "url"
    }
}
