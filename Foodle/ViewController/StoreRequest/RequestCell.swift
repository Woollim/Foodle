//
//  RequestCell.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 2. 6..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

class RequestSwitchCell: UITableViewCell{
    
    @IBOutlet weak var checker: UISwitch!
    
}

class RequestEditCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var editText: EditText!
    
}

class RequestTextCell: UITableViewCell{
 
    @IBOutlet weak var titleLabel: UILabel!
    
}
