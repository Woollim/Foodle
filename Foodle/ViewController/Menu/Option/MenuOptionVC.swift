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
    
    var foodName = "오늘도 감자를 먹는다."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentArr = [("빵 종류를 선택하세요.", "허니브레드, 갈릭브레드, 그냥브레드, 막 브레드"), ("빵 종류를 선택하세요.", "허니브레드, 갈릭브레드, 그냥브레드, 막 브레드")]
        option = .option
        initTableView(tableView)
        titleLabel.text = "\(foodName)\n옵션"
    }
    
    override func goNext(_ data: (String, String)?) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: option.getNextVCId()) as! MenuOptionEditVC
        nextVC.data = data
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func back(){
        goBack()
    }

}
