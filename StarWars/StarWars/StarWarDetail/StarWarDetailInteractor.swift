//
//  StarWarDetailInteractor.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class StarWarDetailInteractor {
    weak var output: StarWarDetailInteractorOutput?
    private let person: Person

    init(person: Person) {
        self.person = person
    }
}

extension StarWarDetailInteractor: StarWarDetailInteractorInput {
    func clicked() {
        output?.nextScreen(profile: person)
    }
    
    func arrived() {
         output?.showPerson(profile: person)
    }
    
    func loaded() {
        output?.loaded(profile: person)
    }
}


