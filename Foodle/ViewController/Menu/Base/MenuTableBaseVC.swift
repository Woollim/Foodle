//
//  MenuOptionBaseTableDelegate.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 25..
//  Copyright © 2018년 root. All rights reserved.
//

import Foundation
import UIKit

class MenuTableBaseVC: UIViewController, UITableViewDelegate{
    
    let addCellId = "MenuAddCell"
    
    var contentArr = [(String, String)]()
    var option: MenuOption = .size
    
    func initTableView(_ tableView: UITableView){
        tableView.delegate = self
        tableView.register(UINib.init(nibName: addCellId, bundle: nil), forCellReuseIdentifier: addCellId)
    }
    
    func goNext(_ data: (String, String)? = nil){}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == contentArr.count{ self.goNext() }
        else{
            let data = contentArr[indexPath.row]
            showEditAlert(data.0, goNext: { self.goNext(data) })
        }
    }
    
    func showEditAlert(_ contentTitle: String, goNext: @escaping (() -> ())){
        showAlert(title: nil, message: nil, style: .actionSheet, actions: [UIAlertAction.init(title: "\(option.getTitle()) 수정", style: .default){ _ in goNext()}, UIAlertAction.init(title: "\((option.getTitle())) 삭제", style: .destructive){ _ in self.setDeleteAlert(contentTitle)}])
    }
    
    func setDeleteAlert(_ contentTitle: String){
        showAlert(title: "\(option.getTitle())삭제", message: "\(option.getTitle())(\(contentTitle))를 삭제합니다.", style: .alert, actions: [UIAlertAction.init(title: "확인", style: .default, handler: nil)])
    }
    
    func showAlert(title: String?, message: String?, style: UIAlertControllerStyle, actions: [UIAlertAction]){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: style)
        for action in actions{
            alert.addAction(action)
        }
        alert.addAction(UIAlertAction.init(title: "취소", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
