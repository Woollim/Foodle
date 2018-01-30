//
//  MenuStepBaseVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 29..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuStepBaseVC: UIViewController {
    
    let cellId = "MenuStepCell"
    let titleCellId = "MenuTitleCell"
    
    var titleText = ""
    
    var contentArr = [(String, String)]()

    func initTableView(_ tableView: UITableView){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.register(UINib.init(nibName: titleCellId, bundle: nil), forCellReuseIdentifier: titleCellId)
    }
    
    func buttonClick(_ row: Int){ }

}

extension MenuStepBaseVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCellId, for: indexPath) as! MenuTitleCell
            cell.titleLabel.text = titleText
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuStepCell
        let row = indexPath.row - 1
        let data = contentArr[row]
        cell.titleLabel.text = data.0
        cell.subLabel.text = data.1
        cell.buttonClick = { self.buttonClick(row) }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 156
        }
        return 148
    }
    
}
