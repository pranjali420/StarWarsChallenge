//
//  StarWarDetailProtocols.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

protocol StarWarDetailWireframe: class {
    func present(profile: Person)
   // func routToNext()
}

protocol StarWarDetailUser: class {
    func arrived()
    func load()
    func click()
    
}

protocol StarWarDetailInteractorInput: class {
   func arrived()
   func loaded()
   func clicked()
}

protocol StarWarDetailInteractorOutput: class {
    func loaded(profile: Person)
    func wantToShowScreen(for person: Person)
    func showPerson(profile: Person)
    func nextScreen(profile: Person)
}

protocol StarWarDetailUI: class {
    init(_ presenter: StarWarDetailUser)
    var viewController: UIViewController { get }
    func show(profile: Person)
}

extension StarWarDetailUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}
