//
//  RequestStoreVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 2. 6..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxKeyboard

class RequestStoreVC: UIViewController {

    let titleCellId = "MenuTitleCell"
    let switchCellId = "RequestSwitchCell"
    let editCellId = "RequestEditCell"
    let textCellId = "RequestTextCell"
    
    @IBOutlet weak var buttonheight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    var textFieldArr = [UITextField]()
    
    let titleArr = ["푸드트럭\n등록 요청", "","푸드트럭 이름", "푸드트럭 연락처", "제보자 연락처", "푸드트럭 사진 등록", "푸드트럭 위치 등록"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
    }
    
    func initTable(){
        
        // FIXME: xib이나 stroyboard에서 datasource랑 delegate를 연결하는 방법이 있으니, 찾아보세요. 코드에서 불필요한 부분을 줄이는데, 도움이 됩니다.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: titleCellId, bundle: nil), forCellReuseIdentifier: titleCellId)
        tableView.rx.itemSelected.subscribe(onNext: { [unowned self] index in
            self.tableView.cellForRow(at: index)?.isSelected = false
            self.view.endEditing(true)
        }).disposed(by: disposeBag)
        RxKeyboard.instance.visibleHeight.asObservable()
            .subscribe(onNext: { [unowned self] height in
                self.buttonheight.constant = height + 16
                self.view.layoutIfNeeded()
            }).disposed(by: disposeBag)
    }

}

extension RequestStoreVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = titleArr[indexPath.row]
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCellId, for: indexPath) as! MenuTitleCell
            cell.titleLabel.text = title
            cell.titleLabel.textColor = UIColor.black
            cell.backgroundColor = UIColor.white
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: switchCellId, for: indexPath) as! RequestSwitchCell
            return cell
        case 2...4:
            let cell = tableView.dequeueReusableCell(withIdentifier: editCellId, for: indexPath) as! RequestEditCell
            cell.titleLabel.text = title
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: textCellId, for: indexPath) as! RequestTextCell
            cell.titleLabel.text = title
            return cell
        }
    }
    
    // MARK: 이 부분은 특별히 말씁드릴 부분은 없으나, 참고 삼아 Auto-sizing(혹은 self-sizing) Cell을 찾아보세요.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 132
        case 1:
            return 60
        case 2...4:
            return 90
        default:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 5: performSegue(withIdentifier: "goPhoto", sender: nil)
        case 6: performSegue(withIdentifier: "goPlace", sender: nil)
        default: break
        }
    }
    
}

class RequestNavigationShape: RedNavigationShape{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationBar.barTintColor = UIColor.white
        navigationBar.tintColor = Color.red.getColor()
    }
    
}
