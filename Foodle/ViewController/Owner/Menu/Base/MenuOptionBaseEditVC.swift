//
//  MenuOptionBaseEditVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 29..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionBaseEditVC: MenuTableBaseVC {
    
    let cellId = "MenuSingleCell"
    
    override func initTableView(_ tableView: UITableView) {
        super.initTableView(tableView)
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }

}

extension MenuOptionBaseEditVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if option != .nonAdd{
            return contentArr.count + 1
        }else{
            return contentArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == contentArr.count && option != .nonAdd{
            let cell = tableView.dequeueReusableCell(withIdentifier: addCellId, for: indexPath) as! MenuAddCell
            cell.titleLabel?.text = "새로운 \(option.getTitle()) 추가"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuSingleCell
            let data = contentArr[indexPath.row]
            cell.titleLabel.text = data.0
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
