//
//  Shape.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 2..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

class RedButtonShape: RoundButtonShape{
    
    override func setLayout(){
        super.setLayout()
        backgroundColor = Color.red.getColor()
        tintColor = .white
    }
    
}

class RedStrokeButtonShape: RoundButtonShape{
    
    override func setLayout(){
        super.setLayout()
        layer.borderWidth = 2
        layer.borderColor = Color.red.getColor().cgColor
        backgroundColor = .white
        tintColor = Color.red.getColor()
    }
    
}

class RoundButtonShape: UIButton{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
    }
    
    func setLayout(){
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        layer.cornerRadius = frame.height / 2
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
