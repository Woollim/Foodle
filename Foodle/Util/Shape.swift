//
//  Shape.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 2..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

class RedButtonShape: UIButton{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
    }
    
    func setLayout(){
        layer.cornerRadius = frame.height / 2
        backgroundColor = Color.red.getColor()
        tintColor = .white
    }
    
}

enum Color{
    case red
    
    func getColor() -> UIColor{
        switch self {
        case .red:
            return UIColor.init(red: 238/255, green: 85/255, blue: 85/255, alpha: 1)
        }
    }
}
