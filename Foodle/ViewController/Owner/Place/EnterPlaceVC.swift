//
//  EnterPlaceVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 24..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class EnterPlaceVC: UIViewController {

    @IBOutlet weak var addressEdit: EditText!
    @IBOutlet weak var addressAddEdit: EditText!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func back(_ sender: Any) {
        self.goBack()
    }
    
}
