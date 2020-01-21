//
//  StarWarCharactersEntity.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

struct StarWarCharactersEntity {
    var people: [Person]
}

extension StarWarCharactersEntity {
    init() {
        self.people = []
    }
}
