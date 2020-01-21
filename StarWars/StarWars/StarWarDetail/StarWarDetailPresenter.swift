//
//  StarWarDetailPresenter.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class StarWarDetailPresenter {
    private weak var wireframe: StarWarDetailWireframe?
    private let interactor: StarWarDetailInteractorInput
    weak var ui: StarWarDetailUI?

    init(interactor: StarWarDetailInteractorInput,
         wireframe: StarWarDetailWireframe?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension StarWarDetailPresenter: StarWarDetailUser {
    func click() {
        interactor.clicked()
    }
    
    func arrived() {
        interactor.arrived()
    }
    
    func load() {
        interactor.loaded()
    }
}

// MARK:- StarWarDetailInteractorOutput

extension StarWarDetailPresenter: StarWarDetailInteractorOutput {
    func showPerson(profile: Person) {
        ui?.show(profile: profile)
    }
    
    func loaded(profile: Person) {
         ui?.show(profile: profile)
    }
    
    func wantToShowScreen(for person: Person) {
        wireframe?.present(profile: person)
    }
    func nextScreen(profile: Person) {
       // wireframe?.routToNext()
        wireframe?.present(profile: profile)
    }
    
}
