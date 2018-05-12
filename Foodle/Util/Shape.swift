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
    
    override func awakeFromNib() {
        setLayout()
    }
    
    func setLayout(){
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        layer.cornerRadius = frame.height / 2
    }
    
}

class ExitButtonShape: UIButton{
    
    override func awakeFromNib() {
        setLayout()
    }
    
    func setLayout(){
        let image = UIImage.init(named: "exit_icon")?.withRenderingMode(.alwaysTemplate)
        setImage(image, for: .normal)
        
        // FIXME: Color literal을 검색해보세요. 가독성 측면이나 수정에도 용이할듯 합니다.
        tintColor = Color.red.getColor()
        imageEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4)
    }
    
}

class RedNavigationShape: UINavigationController{
    
    override func awakeFromNib() {
        navigationBar.barTintColor = Color.red.getColor()
        navigationBar.tintColor = UIColor.white
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
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
