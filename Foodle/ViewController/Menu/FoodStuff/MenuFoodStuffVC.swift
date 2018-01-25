//
//  MenuFoodStuffVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 24..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuFoodStuffVC: MenuOptionBaseVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var foodName = "오늘먹고 낼 죽는다! 덮밥"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView(tableView)
        option = .foodStuff
        contentArr = [("치즈 슬라이스", "500원"), ("치즈 슬라이스", "500원"), ("치즈 슬라이스", "500원"), ("치즈 슬라이스", "500원"), ("치즈 슬라이스", "500원"), ("치즈 슬라이스", "500원")]
        titleLabel.text = "\(foodName)\n추가재료"
    }
    
    override func goNext(_ data: (String, String)?) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: option.getNextVCId()) as! MenuFoodStuffEditVC
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func back(){
        goBack()
    }

}
