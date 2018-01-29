//
//  EnterPlaceVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 24..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class EnterPlaceVC: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addressAddTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.imageView?.tintColor = Color.red.getColor()
    }

}
