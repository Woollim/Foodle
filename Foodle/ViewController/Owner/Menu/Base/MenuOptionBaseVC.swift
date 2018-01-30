//
//  OptionBaseVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 24..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionBaseVC: MenuTableBaseVC {
    
    let cellId = "MenuDetailCell"
    
    override func initTableView(_ tableView: UITableView){
        super.initTableView(tableView)
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.dataSource = self
    }

}

extension MenuOptionBaseVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == contentArr.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: addCellId, for: indexPath) as! MenuAddCell
            cell.titleLabel?.text = "새로운 \(option.getTitle()) 추가"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuDetailCell
            let data = contentArr[indexPath.row]
            cell.titleLabel.text = data.0
            cell.subLabel.text = data.1
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == contentArr.count{ return 50 }
        else{ return 80 }
    }
    
}
