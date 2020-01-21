//
//  StarWarDetailView.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

extension StarWarDetailAssembler {
    func assemble(with wireframe: StarWarDetailWireframe) -> StarWarDetailUI {
        return assemble(with: wireframe, viewType: StarWarDetailView.self)
    }
}

class StarWarDetailView: UIViewController {
    private let user: StarWarDetailUser

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var skincolor: UILabel!
    @IBOutlet weak var eyecolor: UILabel!
    @IBOutlet weak var haircolor: UILabel!
    
    @IBOutlet weak var buttonTabbed: UIButton!
    @IBAction func magicBtn(_ sender: Any) {
        user.click()
    }
    required init(_ user: StarWarDetailUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "starWarDetail"
        user.arrived()
    }
}
// MARK:- StarWarDetailUI

extension StarWarDetailView: StarWarDetailUI {
    func show(profile: Person) {
        nameLabel.text = profile.name
        genderLabel.text = profile.gender
        heightLabel.text = profile.height
        skincolor.text = profile.skin_color
        eyecolor.text = profile.eye_color
        haircolor.text = profile.hair_color
    }
}
