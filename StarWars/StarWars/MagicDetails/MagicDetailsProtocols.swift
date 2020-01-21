//
//  MagicDetailsProtocols.swift
//  StarWars
//
//  Created by Pranjali Wagh on 09/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

protocol MagicDetailsWireframe: class {
   // func routToNext()

}

protocol MagicDetailsUser: class {

}

protocol MagicDetailsInteractorInput: class {

}

protocol MagicDetailsInteractorOutput: class {

}

protocol MagicDetailsUI: class {
    init(_ presenter: MagicDetailsUser)
    var viewController: UIViewController { get }
}

extension MagicDetailsUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}

