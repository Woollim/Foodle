//
//  MenuOptionEditVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionEditVC: MenuTableBaseVC {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priseTextField: UITextField!
    @IBOutlet weak var selectionTableView: UITableView!
    
    var data: (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentArr = [("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", "")]
        initTableView(selectionTableView)
        selectionTableView.dataSource = self
    }
    
    override func goNext(_ data: (String, String)?) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "") as! SelectionEditVC
        present(nextVC, animated: true, completion: nil)
    }

}

extension MenuOptionEditVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = contentArr[indexPath.row].0
        return cell
    }
    
}
