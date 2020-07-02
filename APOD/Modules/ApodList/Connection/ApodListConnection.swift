//
//  ApodListConnection.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

class ApodListConnection {

    // MARK: - Custom Functions
    func getApodListBy(date: Range, completion: @escaping (ResultConnection<[Apod]>) -> Void) {
        guard let url = ApodAPI.Endpoints.getApodListByDates(date.start, date.end).url else {
            completion(.failure(.urlNilError))
            return
        }
        ApodAPI.taskForGETRequest(in: url, response: [Apod].self, completion: completion)
    }
}
