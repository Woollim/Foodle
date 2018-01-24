//
//  MenuStepVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuStepVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellId = "MenuStepCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    var contentArr = [(String, String)]()
    var nextVCIdArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "여러분의 음식을\n세상에 알려주세요."
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        contentArr = [("메뉴 기본정보", "메뉴의 이름, 가격, 설명, 원산지 정보, 태그 등을 등록합니다."), ("미각을 시각화합니다.", "메뉴를 잘 표현하는 사진을 등록해주세요."), ("추가 옵션", "메뉴의 사이즈, 추가 제료, 카테고리등을 설정합니다.")]
        nextVCIdArr = ["MenuBaseInfo1View", ""]
    }
    
    @IBAction func unwindToMenuStep(_ segue: UIStoryboardSegue){
        
    }

}

extension MenuStepVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = contentArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuStepCell
        cell.titleLabel.text = data.0
        cell.subLabel.text = data.1
        cell.buttonClick = { print("hello world") }
        if indexPath.row > 0{ cell.setUnClick() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }
    
}
