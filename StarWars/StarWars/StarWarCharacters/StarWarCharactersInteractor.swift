//
//  StarWarCharactersInteractor.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation
import UIKit

class StarWarCharactersInteractor {
    weak var output: StarWarCharactersInteractorOutput?
    var entity: StarWarCharactersEntity
    let network: NetworkComponent

    init(entity: StarWarCharactersEntity, network: NetworkComponent) {
        self.entity = entity
        self.network = network
    }
}

extension StarWarCharactersInteractor: StarWarCharactersInteractorInput {
    func checkNetwork() {
        if ReachabilityManager.isConnectedToNetwork() == true {
            self.output?.showAlertWithAvailableNetwork()
            print("Internet connection AVAILABLE!")
        } else {
             self.output?.showAlertWithUnavailableNetwork()
            
             print("Internet connection FAILED!")
        }
    }
    func loaded() {
        checkNetwork()
        network.get { [weak self] people,Error  in
            self?.entity.people = people
            self?.output?.loaded(people: people)
        }
    }
    
    func selected(index: Int) {
        output?.ShowDetails(of: entity.people[index])
    }
    
    
}
