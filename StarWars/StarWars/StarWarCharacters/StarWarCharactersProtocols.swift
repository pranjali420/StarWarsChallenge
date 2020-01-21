//
//  StarWarCharactersProtocols.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

protocol StarWarCharactersWireframe: class {
    func select(person: Person)
}

protocol StarWarCharactersUser: class {
    func loaded()
    func select(index: Int)
}

protocol StarWarCharactersInteractorInput: class {
    func loaded()
    func selected(index: Int)
}

protocol StarWarCharactersInteractorOutput: class {
    func loaded(people: [Person])
    func ShowDetails(of person: Person)
    func showAlertWithAvailableNetwork()
    func showAlertWithUnavailableNetwork()
}

protocol StarWarCharactersUI: class {
    init(_ presenter: StarWarCharactersUser)
    var viewController: UIViewController { get }
    
    func startLoading()
    func finishLoading()
    func loaded(ViewModel: [ViewModel])
    func getPersons(persons: [Person])
    func NetworkConnectionAvailable()
    func NetworkConnectionUnavailable()
}

extension StarWarCharactersUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}
