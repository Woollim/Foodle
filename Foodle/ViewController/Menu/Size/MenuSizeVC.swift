//
//  MenuSizeVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuSizeVC: MenuOptionBaseVC{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let menuName = "참깨빵위의 맛있는 빅맥"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentArr = [("스몰", "3500원"), ("스몰", "3500원"), ("스몰", "3500원"), ("스몰", "3500원"), ("스몰", "3500원")]
        option = .size
        initTableView(tableView)
        titleLabel.text = "\(menuName)\n사이즈"
    }
    
    override func goNext(_ data: (String, String)? = nil) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: option.getNextVCId()) as! MenuSizeEditVC
        nextVC.data = data
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func back(){
        goBack()
    }
    
    @IBAction func next(){
        goBack()
    }

}
