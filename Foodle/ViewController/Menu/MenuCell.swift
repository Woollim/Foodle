//
//  MenuCell.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 21..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

class MenuTitleCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        backgroundColor = Color.red.getColor()
    }
    
}

class MenuStepCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var button: RedButtonShape!
    
    var buttonClick: (() -> ())?
    
    func setUnClick(){
        button.backgroundColor = .lightGray
        button.isEnabled = false
    }
    
    func setClick(){
        button.backgroundColor = Color.red.getColor()
        button.isEnabled = true
    }
    
    @IBAction func click(){
        buttonClick?()
    }
    
}

class MenuDetailCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
}

class MenuAddCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    
}

class MenuSingleCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    
}
