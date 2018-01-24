//
//  OptionBaseVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 24..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuOptionBaseVC: UIViewController {
    
    let cellId = "MenuDetailCell"
    let addCellId = "MenuAddCell"
    var option: MenuOption = .size
    
    var contentArr = [(String, String)]()
    
    func initTableView(_ tableView: UITableView){
        tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.register(UINib.init(nibName: addCellId, bundle: nil), forCellReuseIdentifier: addCellId)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func goNext(_ data: (String, String)? = nil){
        
    }

}

extension MenuOptionBaseVC: UITableViewDataSource, UITableViewDelegate{
    
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
        else{ return 70 }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == contentArr.count{ self.goNext() }
        else{
            let data = contentArr[indexPath.row]
            showEditAlert(data.0, goNext: { self.goNext(data) })
        }
    }
    
    func showEditAlert(_ contentTitle: String, goNext: @escaping (() -> ())){
        showAlert(title: nil, message: nil, style: .actionSheet, actions: [UIAlertAction.init(title: "\(option.getTitle()) 수정", style: .default){ _ in goNext()},
            UIAlertAction.init(title: "\((option.getTitle())) 삭제", style: .destructive){ _ in self.setDeleteAlert(contentTitle)}])
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

enum MenuOption {
    
    case size
    case foodStuff
    case option
    
    func getTitle() -> String{
        switch self {
        case .size:
            return "사이즈"
        case .foodStuff:
            return "추가재료"
        case .option:
            return "옵션"
        }
    }
    
    func getNextVCId() -> String{
        switch self {
        case .size:
            return "MenuSizeEditView"
        case .foodStuff:
            return "추가재료"
        case .option:
            return "옵션"
        }
    }
    
}
