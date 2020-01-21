//
//  NetworkComponent.swift
//  StarWars
//
//  Created by Pranjali Wagh on 01/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkComponent {
    func get(_ completion: @escaping (([Person], Error?) -> Void))
}

class UrlSessionComponent: NetworkComponent {
   // let reachability = Reachability()
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    func get(_ completion: @escaping (([Person], Error?) -> Void)) {
        struct Response: Decodable {
            let results: [Person]
        }
        
       // let session = URLSession(configuration: .default)

        let task = session.dataTask(with: URL(string: "https://swapi.co/api/people")!) { (data, response, error) in
          
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let res = try decoder.decode(Response.self, from: data)
                        completion(res.results, ServiceError.success)
                    } catch  {
                        completion([], ServiceError.failed)
                    }
                } else {
                    completion([], ServiceError.failed)
                }
            }
        }
        task.resume()
    }
}
