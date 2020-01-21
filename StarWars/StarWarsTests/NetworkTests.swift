//
//  NetworkTests.swift
//  StarWarsTests
//
//  Created by Pranjali Wagh on 12/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import XCTest
@testable import StarWars
class NetworkTests: XCTestCase {
    var message: ServiceError?
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
    
    func testApiResponse() {
        let session = URLSessionMock()
        let urlcomponet = UrlSessionComponent(session: session)
        guard let url = URL(string: "https://swapi.co/api/people") else {
            return
        }
        XCTAssertEqual(URL(string: "https://swapi.co/api/people"),url)
        
         let data = try? Data(contentsOf: url, options: [])
        session.data = data
        XCTAssert(true)
        DispatchQueue.main.async {
        urlcomponet.get { (person, error) in
            struct Response: Decodable {
                let results: [Person]
            }
            do {
                let jsonData = try JSONDecoder().decode(Response.self, from: data!)
                XCTAssertNotNil(jsonData.results)
                XCTAssertEqual(self.message, ServiceError.success)
                XCTAssertEqual(self.message, ServiceError.failed)
                
            }catch {
                XCTFail(error.localizedDescription)
                }
            }
        }
    }
}

class URLSessionMock: URLSession {
    typealias completionHandler = (Data?, URLResponse?, Error?) -> Void
    var data: Data?
    var error: Error?
    
    override func dataTask(with url: URL, completionHandler: @escaping completionHandler) -> URLSessionDataTask {
        let data = self.data
        let error = self.error
        return URLSessionDataTaskMock {
            completionHandler(data, nil, error)
        }
    }
}

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
