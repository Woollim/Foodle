//
//  MainVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 15..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit
import Pulley

class MainVC: UIViewController {

    var pullyVC: PulleyViewController? = nil
    
    override func viewDidLoad() {
        pullyVC = PulleyViewController.init(contentViewController: getVC("TempView"), drawerViewController: getVC("ShopMainView"))
        
    }

}

extension MainVC {
    
    func getVC(_ id: String) -> UIViewController{
        return (storyboard?.instantiateViewController(withIdentifier: id))!
    }
    
}
