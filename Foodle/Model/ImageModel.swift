//
//  ImageModel.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 30..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

struct ImageModel {
    let fileName: String
    let key: String
    let type = "image/jpeg"
    let data: Data
    
    init?(key: String, fileName: String, image: UIImage) {
        self.key = key
        self.fileName = "\(fileName).jpeg"
        guard let data = UIImageJPEGRepresentation(image, 0.7) else{ return nil }
        self.data = data
    }
    
}
