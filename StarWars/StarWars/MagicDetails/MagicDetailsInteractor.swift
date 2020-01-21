//
//  MagicDetailsInteractor.swift
//  StarWars
//
//  Created by Pranjali Wagh on 09/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class MagicDetailsInteractor {
    weak var output: MagicDetailsInteractorOutput?
    private let entity: Person

    init(entity: Person) {
        self.entity = entity
    }
}

extension MagicDetailsInteractor: MagicDetailsInteractorInput {

}
