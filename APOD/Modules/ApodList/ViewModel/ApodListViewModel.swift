//
//  ApodListViewModel.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import UIKit

// MARK: - Typealiases
/// TypeAlias for the start and end string date
typealias Range = (start: String, end: String)

class ApodListViewModel {

    // MARK: - Properties
    private let connection = ApodListConnection()
    private let calendar = Calendar.current
    private (set) var todayApod: Apod?
    private(set) var apodList = [Apod]()
    lazy var apod: (Int) -> Apod = { self.apodList[$0] }

    // MARK: - Custom Functions
    /**
     ## Get apod list
     Makes use of networking to retrieve  the last eight APOD (**A**stronomy **P**icture **O**f **D**ay)

     - Parameter onComplete: closure that is invoked when the fetch apod process is completed
     - Parameter onFailure: closure that is invoked when the fetch apod process have a error **ApodAPI.NetworkError**
     */
    func getApodList(onComplete: @escaping () -> Void,
                     onFailure: @escaping (ApodAPI.NetworkError) -> Void) {


        guard let eightDaysAgo = calendar.date(byAdding: .day, value: -7, to: Date())?.getDateWith(format: .apodDate) else {
            onFailure(.unknownError)
            return
        }
        let today = Date().getDateWith(format: .apodDate)

        connection.getApodListBy(date: Range(start: eightDaysAgo, end: today)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let apodList):
                var apodListRetrieve = apodList
                apodListRetrieve.sort { $0.date > $1.date }
                if apodListRetrieve.count > 0 {
                    self.todayApod = apodListRetrieve.removeFirst()
                    self.apodList = apodListRetrieve
                }
                onComplete()
            case .failure(let error):
                onFailure(error)
            }
        }
    }
}
