//
//  StarWarDetailAssembler.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

struct StarWarDetailAssembler {
    let person: Person

    func assemble(with wireframe: StarWarDetailWireframe,
                  viewType: StarWarDetailUI.Type) -> StarWarDetailUI {
        let interactor = StarWarDetailInteractor(person: person)
        let presenter = StarWarDetailPresenter(interactor: interactor, wireframe: wireframe)
        let view = viewType.init(presenter)

        interactor.output = presenter
        presenter.ui = view

        return view
    }
}
