//
//  CharacterCell.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.size.width / 5
    }
}
