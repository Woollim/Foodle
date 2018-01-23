//
//  MenuFoodStuffVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 24..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuFoodStuffVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellId = "MenuDetailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension MenuFoodStuffVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
