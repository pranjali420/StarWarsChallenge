//
//  ServiceError.swift
//  StarWars
//
//  Created by Pranjali Wagh on 11/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation
import UIKit

enum ServiceError: Error {
    case success
    case failed
    case noInternetConnection
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
}

