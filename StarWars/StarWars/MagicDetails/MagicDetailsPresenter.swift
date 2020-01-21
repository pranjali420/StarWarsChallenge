//
//  MagicDetailsPresenter.swift
//  StarWars
//
//  Created by Pranjali Wagh on 09/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class MagicDetailsPresenter {
    private weak var wireframe: MagicDetailsWireframe?
    private let interactor: MagicDetailsInteractorInput
    weak var ui: MagicDetailsUI?

    init(interactor: MagicDetailsInteractorInput,
         wireframe: MagicDetailsWireframe?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension MagicDetailsPresenter: MagicDetailsUser {

}

extension MagicDetailsPresenter: MagicDetailsInteractorOutput {

}
