//
//  StarWarCharactersPresenter.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class StarWarCharactersPresenter {
    private weak var wireframe: StarWarCharactersWireframe?
    private let interactor: StarWarCharactersInteractorInput
    weak var ui: StarWarCharactersUI?

    init(interactor: StarWarCharactersInteractorInput,
         wireframe: StarWarCharactersWireframe?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension StarWarCharactersPresenter: StarWarCharactersUser {
    func loaded() {
        ui?.startLoading()
        interactor.loaded()
    }
    
    func select(index: Int) {
        interactor.selected(index: index)
    }
}

extension StarWarCharactersPresenter: StarWarCharactersInteractorOutput {
    func loaded(people: [Person]) {
        ui?.finishLoading()
        let viewModels = people.map({ViewModel($0)})
        
        ui?.loaded(ViewModel: viewModels)
        ui?.getPersons(persons: people)
    }
    func ShowDetails(of person: Person) {
        wireframe?.select(person: person)
    }
    func showAlertWithAvailableNetwork() {
        ui?.NetworkConnectionAvailable()
    }
    func showAlertWithUnavailableNetwork() {
        ui?.NetworkConnectionUnavailable()
    }
}

private extension ViewModel {
    init(_ person: Person) {
        self.title = "\(person.name)"
        self.subtitle = "BirthYear: \(person.birth_year)"
    }
}
