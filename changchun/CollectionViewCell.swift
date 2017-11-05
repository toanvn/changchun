//
//  CollectionViewCell.swift
//  changchun
//
//  Created by Toan Phan on 11/2/17.
//  Copyright © 2017 Toan Phan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    
    func dislayContent(imgUrl: String) {
        avatar.image = UIImage(named: "logo")
    }
    
}
