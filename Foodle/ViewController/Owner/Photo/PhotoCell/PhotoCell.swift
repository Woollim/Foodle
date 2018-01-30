//
//  PhotoCell.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 29..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UIView!
    
    override func awakeFromNib() {
        titleView.layer.cornerRadius = 4
    }
    
}
