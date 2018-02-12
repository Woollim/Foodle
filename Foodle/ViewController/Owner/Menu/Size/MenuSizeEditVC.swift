//
//  MenuSizeEditVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuSizeEditVC: UIViewController {

    @IBOutlet weak var sizeNameEdit: EditText!
    @IBOutlet weak var sizePriseEdit: EditText!
    
    var data: (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sendData = data{
            sizeNameEdit.textField.text = sendData.0
            sizePriseEdit.textField.text = sendData.1
        }
    }
    
    @IBAction func back(){
        goBack()
    }
    
}
