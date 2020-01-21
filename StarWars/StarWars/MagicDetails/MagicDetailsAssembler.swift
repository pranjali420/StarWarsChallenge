//
//  MagicDetailsAssembler.swift
//  StarWars
//
//  Created by Pranjali Wagh on 09/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

struct MagicDetailsAssembler {
    //let entity: MagicDetailsEntity
    let profile: Person

    func assemble(with wireframe: MagicDetailsWireframe,
                  viewType: MagicDetailsUI.Type) -> MagicDetailsUI {
        let interactor = MagicDetailsInteractor(entity: profile)
        let presenter = MagicDetailsPresenter(interactor: interactor, wireframe: wireframe)
        let view = viewType.init(presenter)

        interactor.output = presenter
        presenter.ui = view

        return view
    }
}
