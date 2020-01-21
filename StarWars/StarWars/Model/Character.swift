//
//  Character.swift
//  StarWars
//
//  Created by Pranjali Wagh on 01/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation
import UIKit

struct Person: Codable, Equatable {
    let name: String
    let height: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let gender: String
    let birth_year: String
    //let films: [URL]
}

//struct Film: Codable  {
//    let title: String
//    let openingcrawl: String
//
//}


struct ViewModel {
    let title: String
    let subtitle: String
    
}


enum CodingKeys: String, CodingKey {
    case title
    case openingcrawl = "opening_crawl"

}

