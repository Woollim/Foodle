//
//  ShopMainVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 15..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class ShopMainVC: UIViewController {
    
    let heightArr = [108, 52, 32, 54, 54, 54]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension ShopMainVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heightArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // FIXME: 다른 곳(RequestStoreVC) 에서는 cell ID를 클래스 내부에 상수화해서 쓰셨는데, 여긴 함수안에 local에 생성하신 이유가 있나요?
        let cellNameArr = ["ShopMainTitleCell", "ShopMainPlaceCell", "ShopMainInfoTitleCell", "ShopMainInfoCell"]
        
        if indexPath.row > 2{
            
            return tableView.dequeueReusableCell(withIdentifier: cellNameArr[3], for: indexPath)
        }else{
            return tableView.dequeueReusableCell(withIdentifier: cellNameArr[indexPath.row], for: indexPath)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.init(heightArr[indexPath.row])
    }
    
}

class ShopMainImageCell: UITableViewCell{
    
    //height : 128
    
    var shopImageView: UIImageView? = nil
    
    override func awakeFromNib() {
        shopImageView = UIImageView.init(frame: contentView.frame)
        
    }
    
}

class ShopMainTitleCell: UITableViewCell{
    
    //height : 128
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBAction func like(_ sender: UIButton) {
        
    }
    
}

//ShopMainInfoTitleCell
//height : 32

class ShopMainPlaceCell: UITableViewCell{
    
    //height : 52
    @IBOutlet weak var placeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        contentView.backgroundColor = .lightGray
    }
    
    @IBAction func goMap(_ sender: Any) {
        
    }
    
}

class ShopMainInfoCell: UITableViewCell{
    
    //height : 48
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var infoContentLabel: UILabel!
    
}
