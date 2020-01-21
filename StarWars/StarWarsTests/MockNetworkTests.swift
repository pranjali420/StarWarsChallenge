//
//  MockNetworkTests.swift
//  StarWarsTests
//
//  Created by Pranjali Wagh on 13/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation
@testable import StarWars

class MockNetworkTests{
    var shouldReturnError = false
    var apiCall = false
    var results = [Person]()
    
    enum MockServiceError: Error {
        case responseError
    }
    convenience init() {
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    let resultsResponse: [String: Any] = [
        "results": [
            [
                   "name": "Luke Skywalker",
                   "height": "172",
                   "hair_color": "blond",
                   "skin_color": "fair",
                   "eye_color": "blue",
                   "gender": "male",
                   "birth_year": "19BBY"
            ],
            [      "name": "C-3PO",
                   "height": "167",
                   "hair_color": "n/a",
                   "skin_color": "gold",
                   "eye_color": "yellow",
                   "gender": "n/a",
                   "birth_year": "112BBY"
                 ]
            ]
    ]
    
    
}
    

extension MockNetworkTests: NetworkComponent {
    func get(_ completion: @escaping (([Person], Error?) -> Void)) {
        apiCall = true
        
        if shouldReturnError {
            completion([], MockServiceError.responseError)
        } else {
            completion(results, nil)
        }
    }
}
