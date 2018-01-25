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
    @IBOutlet weak var titleLabel: UILabel!
    
    var data: (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        option = .selection
        contentArr = [("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", ""), ("허니브레드", "")]
        initTableView(selectionTableView)
        selectionTableView.dataSource = self
    }
    
    override func goNext(_ data: (String, String)?) {
        
    }
    
    @IBAction func back(){
        goBack()
    }

}

extension MenuOptionEditVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == contentArr.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: addCellId, for: indexPath) as! MenuAddCell
            cell.titleLabel?.text = "새로운 \(option.getTitle()) 추가"
            return cell
        }else{
            let cell = UITableViewCell()
            let data = contentArr[indexPath.row]
            cell.textLabel?.text = data.0
            return cell
        }
    }
    
}
