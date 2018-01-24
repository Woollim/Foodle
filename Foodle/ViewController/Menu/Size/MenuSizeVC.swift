//
//  MenuSizeVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuSizeVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "MenuDetailCell"
    let addCellId = ""
    
    let menuName = "참깨빵위의 맛있는 빅맥"
    
    var contentArr = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "\(menuName)\n사이즈"
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension MenuSizeVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == contentArr.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuDetailCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuDetailCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == contentArr.count{ return 50 }
        else{ return 70 }
    }
    
}
