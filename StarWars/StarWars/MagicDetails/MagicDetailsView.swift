//
//  MagicDetailsView.swift
//  StarWars
//
//  Created by Pranjali Wagh on 09/04/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

extension MagicDetailsAssembler {
    func assemble(with wireframe: MagicDetailsWireframe) -> MagicDetailsUI {
        return assemble(with: wireframe, viewType: MagicDetailsView.self)
    }
}

class MagicDetailsView: UIViewController {
    private let user: MagicDetailsUser

    required init(_ user: MagicDetailsUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MagicDetailsView: MagicDetailsUI {

}
