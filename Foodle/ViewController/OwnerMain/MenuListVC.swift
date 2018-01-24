//
//  MenuListVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 23..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension MenuListVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuListCell", for: indexPath) as! MenuListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 48))
        view.backgroundColor = .white
        let label = UILabel.init(frame: CGRect.init(x: 16, y: 14, width: view.frame.width - 32, height: 20))
        label.textColor = .black
        label.text = "메뉴 카테고리"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(label)
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
}

class MenuListCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var progress: UIProgressView!
    
    override func awakeFromNib() {
        titleLabel.text = "제목"
        subLabel.text = "진행도 80%"
        menuImage.backgroundColor = .black
        progress.progress = 80
    }
    
}
