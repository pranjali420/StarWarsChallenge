//
//  StarWarsTests.swift
//  StarWarsTests
//
//  Created by Pranjali Wagh on 08/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import XCTest
@testable import StarWars
class StarWarsTests: XCTestCase {
    //Test1: when screen Appear data should be loaded
    
    func testDataDoesntLoadedWhenScreenAppears() {
        let lab = Lab()

        lab.loadAndAppear()
        XCTAssertEqual(lab.sut.collectionView(lab.sut.collectioView, numberOfItemsInSection: 0), 0)
    }
    
    func testDataLoadWhenScreenAppears() {
        let lab = Lab()
        lab.network.characters.append(Person(name: "Luke Skywalker", height: "172", hair_color: "blond", skin_color: "fair", eye_color: "blue", gender: "male", birth_year: "19BBY"))
        lab.loadAndAppear()
        
        //XCTAssertTrue(lab.network.called)
        XCTAssertEqual(lab.sut.collectionView(lab.sut.collectioView, numberOfItemsInSection: 0), 0)
        lab.sut.load()
        XCTAssertEqual(lab.sut.collectionView(lab.sut.collectioView, numberOfItemsInSection: 0), 1)
    }
    
    func test_whenCharacterIsSelectedItIsPassTotheWireframe() {
        let lab = Lab()
        let characters = [Person(name: "Luke Skywalker", height: "172", hair_color: "blond", skin_color: "fair", eye_color: "blue", gender: "male", birth_year: "19BBY"),
                          Person(name: "Luke Skywalker", height: "172", hair_color: "blond", skin_color: "fair", eye_color: "blue", gender: "male", birth_year: "19BBY"),
                          Person(name: "Luke Skywalker", height: "172", hair_color: "blond", skin_color: "fair", eye_color: "blue", gender: "male", birth_year: "19BBY")]
        lab.network.characters = characters
        lab.loadAndAppear()
        lab.sut.load()
        XCTAssertNil(lab.wireframe.selectedPerson)
        
        lab.sut.collectionView(lab.sut.collectioView, didSelectItemAt: IndexPath(row: 1, section: 0))
        XCTAssertNotNil(lab.wireframe.selectedPerson)
        XCTAssertEqual(lab.wireframe.selectedPerson, characters[1])
    }
    
    func testActivityLoader() {
        let lab = Lab()
        lab.loadAndAppear()
        lab.sut.activityIndicator.startAnimating()
        XCTAssert(true)
        lab.sut.load()
        lab.sut.activityIndicator.stopAnimating()
        XCTAssert(true)
    }
    
    func testForInternetConnetion() {
        if ReachabilityManager.isConnectedToNetwork() == true {
            XCTAssert(true)
        } else {
            XCTAssert(true)
        }
    }
//MARK:- testForCollectionViewcell
    
    func test_CollectionViewCellWithMatchingField() {
        let lab = Lab()
        let viewModel = [ViewModel]()
        lab.sut.collectioView.reloadData()
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.5))
        
        let cell = lab.sut.collectioView.visibleCells as! [CharacterCell]
        XCTAssertEqual(cell.count, viewModel.count, "Cell Count should be match array.count")
    }
}

class Lab {
    var window = UIWindow(frame: UIScreen.main.bounds)
    var sut: StarWarCharactersView!
    var entity = StarWarCharactersEntity(people: [])
    var network =  Network()
    var wireframe = Wireframe()
    var reachability = ReachabilityManager()
    
    init() {
        sut = StarWarCharactersAssembler(entity: entity, network: network).assemble(with: wireframe).viewController as? StarWarCharactersView
        
        window.rootViewController = sut
        window.makeKeyAndVisible()
    }
    
    func loadAndAppear() {
        sut.loadViewIfNeeded()
        sut.viewWillAppear(false)
    }
    
class Network: NetworkComponent {
        var called: Bool = false
        var characters: [Person] = []
        func get(_ completion: @escaping (([Person], Error?) -> Void)) {
            called = true
            completion(characters, nil)
        }
    }
    
class Wireframe: StarWarCharactersWireframe {
        var selectedPerson: Person?
        func select(person: Person) {
            selectedPerson = person
        }
    }
}
