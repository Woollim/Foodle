//
//  MenuOptionEditVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionEditVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priseTextField: UITextField!
    @IBOutlet weak var selectionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionTableView.dataSource = self
        selectionTableView.delegate = self
        selectionTableView.register(UINib.init(nibName: "SelectionCell", bundle: nil), forCellReuseIdentifier: "SelectionCell")
    }

}

extension MenuOptionEditVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionCell", for: indexPath) as! SelectionCell
        return cell
    }
    
}
