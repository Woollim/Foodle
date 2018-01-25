//
//  MenuOptionStepCell.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionStepVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let cellId = "MenuStepCell"
    
    var contentArr = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        titleLabel.text = "추가적인 것을\n등록해 주세요."
        contentArr = [("메뉴 사이즈", "메뉴의 사이즈와 사이즈별 가격을 등록합니다."), ("메뉴 카테고리", "메뉴의 카테고리를 등록합니다."), ("메뉴 옵션", "메뉴의 옵션을 등록합니다."), ("추가 재료", "추가적으로 들어갈 재료를 등록합니다.")]
    }
    
    func buttonClick(_ count: Int){
        let idArr = ["goSize", "goCategory", "goOption", "goFoodStuff"]
        performSegue(withIdentifier: idArr[count], sender: nil)
    }
    
    @IBAction func unwindOptionMain(_ segue: UIStoryboardSegue){
        
    }

}

extension MenuOptionStepVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuStepCell
        let row = indexPath.row
        let data = contentArr[row]
        cell.titleLabel.text = data.0
        cell.subLabel.text = data.1
        cell.buttonClick = { self.buttonClick(row) }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }
    
}
