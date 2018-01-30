//
//  MenuCategoryEditVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 29..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuCategoryEditVC: MenuOptionBaseEditVC {

    @IBOutlet weak var tableVeiw: UITableView!
    
    override func viewDidLoad() {
        initTableView(tableVeiw)
        option = .nonAdd
        tableVeiw.allowsSelection = false
        contentArr = [("hello", ""), ("world", ""), ("nice to", ""), ("meet", "")]
    }
    
    @IBAction func back(){
        goBack()
    }
    
}
