//
//  MenuOptionStepCell.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionStepVC: MenuStepBaseVC {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView(tableView)
        titleText = "추가적인 것 들을\n등록해주세요."
        contentArr = [("메뉴 사이즈", "메뉴의 사이즈와 사이즈별 가격을 등록합니다."), ("메뉴 카테고리", "메뉴의 카테고리를 등록합니다."), ("메뉴 옵션", "메뉴의 옵션을 등록합니다."), ("추가 재료", "추가적으로 들어갈 재료를 등록합니다.")]
    }
    
    override func buttonClick(_ count: Int){
        let idArr = ["goSize", "goCategory", "goOption", "goFoodStuff"]
        performSegue(withIdentifier: idArr[count], sender: nil)
    }
    
    @IBAction func unwindOptionMain(_ segue: UIStoryboardSegue){
        
    }

}
