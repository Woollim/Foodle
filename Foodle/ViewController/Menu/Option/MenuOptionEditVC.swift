//
//  MenuOptionEditVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionEditVC: MenuOptionBaseEditVC {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priseTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var data: (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        option = .selection
        contentArr = [("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", "")]
        initTableView(tableView)
    }
    
    override func goNext(_ data: (String, String)?) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: option.getNextVCId())
        present(nextVC!, animated: true, completion: nil)
    }
    
    @IBAction func back(){
        goBack()
    }

}
