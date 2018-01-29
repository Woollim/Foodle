//
//  SelectionEditVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class SelectionEditVC: MenuOptionBaseEditVC {

    @IBOutlet weak var selectionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        option = .nonAdd
        initTableView(selectionTableView)
        selectionTableView.allowsSelection = false
        contentArr = [("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", "")]
    }
    
    @IBAction func back(){
        goBack()
    }

}
