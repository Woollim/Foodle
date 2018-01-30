//
//  MenuStepVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuStepVC: MenuStepBaseVC{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView(tableView)
        titleText = "당신의 음식을\n세상에 알려주세요."
        contentArr = [("메뉴 기본정보", "메뉴의 이름, 가격, 설명, 원산지 정보, 태그 등을 등록합니다."), ("미각을 시각화합니다.", "메뉴를 잘 표현하는 사진을 등록해주세요."), ("추가 옵션", "메뉴의 사이즈, 추가 재료, 카테고리등을 설정합니다.")]
    }
    
    override func buttonClick(_ row: Int) {
        
    }

}
