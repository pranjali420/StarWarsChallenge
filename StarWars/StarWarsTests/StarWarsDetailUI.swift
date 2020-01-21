//
//  StarWarsDetailUI.swift
//  StarWarsTests
//
//  Created by Pranjali Wagh on 25/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import XCTest
@testable import StarWars
class StarWarsDetailUI: XCTestCase {

    func testExample() {
     let lab = Lab1()
       lab.loadAndAppear()
       XCTAssert(true)
    }
    
    func testAccessibilityIdentifier() {
        let lab = Lab1()
        XCTAssertEqual(lab.sut.view.accessibilityIdentifier, "starWarDetail")
        
        XCTAssertEqual(lab.sut.nameLabel.accessibilityIdentifier, "name")
        XCTAssertEqual(lab.sut.nameLabel.text, lab.profile.name)
        
        XCTAssertEqual(lab.sut.genderLabel.accessibilityIdentifier, "gender")
        XCTAssertEqual(lab.sut.genderLabel.text, lab.profile.gender)
        
        XCTAssertEqual(lab.sut.heightLabel.accessibilityIdentifier, "height")
        XCTAssertEqual(lab.sut.heightLabel.text, lab.profile.height)
        
        XCTAssertEqual(lab.sut.skincolor.accessibilityIdentifier, "skincolor")
        XCTAssertEqual(lab.sut.skincolor.text, lab.profile.skin_color)
        
        XCTAssertEqual(lab.sut.eyecolor.accessibilityIdentifier, "eyecolor")
        XCTAssertEqual(lab.sut.eyecolor.text, lab.profile.eye_color)
        
        XCTAssertEqual(lab.sut.haircolor.accessibilityIdentifier, "haircolor")
        XCTAssertEqual(lab.sut.haircolor.text, lab.profile.hair_color)
    }
    
    func testWhenclickedRouteNextScreen() {
        let lab = Lab1()
        lab.loadAndAppear()
        XCTAssertNil(lab.detailWireframe.profileDetail)
    }
}

class Lab1 {
    var sut: StarWarDetailView!
    var detailWireframe = DetailWireframe()
    var profile = Person(name: "Luke Skywalker", height: "172", hair_color: "blond", skin_color: "fair", eye_color: "blue", gender: "male", birth_year: "19BBY")
    init() {
        sut = StarWarDetailAssembler(person: profile).assemble(with: detailWireframe) as? StarWarDetailView
    }
    func loadAndAppear() {
        sut.loadViewIfNeeded()
        sut.viewWillAppear(false)
    }
}

class DetailWireframe: StarWarDetailWireframe {
    var profileDetail: Person?
    func present(profile: Person) {
        profileDetail = profile
    }
}

