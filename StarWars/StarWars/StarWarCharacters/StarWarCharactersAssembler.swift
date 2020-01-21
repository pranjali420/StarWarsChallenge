//
//  StarWarCharactersAssembler.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

struct StarWarCharactersAssembler {
    let entity: StarWarCharactersEntity
    let network: NetworkComponent
    func assemble(with wireframe: StarWarCharactersWireframe,
                  viewType: StarWarCharactersUI.Type) -> StarWarCharactersUI {
        let interactor = StarWarCharactersInteractor(entity: entity, network: network )
        let presenter = StarWarCharactersPresenter(interactor: interactor, wireframe: wireframe)
        let view = viewType.init(presenter)

        interactor.output = presenter
        presenter.ui = view

        return view
    }
}
