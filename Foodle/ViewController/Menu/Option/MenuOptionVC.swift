//
//  MenuOptionVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionVC: MenuOptionBaseVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentArr = [("빵 종류를 선택하세요.", "허니브레드, 갈릭브레드, 그냥브레드, 막 브레드"), ("빵 종류를 선택하세요.", "허니브레드, 갈릭브레드, 그냥브레드, 막 브레드")]
        option = .option
        initTableView(tableView)
    }

}
