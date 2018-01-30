//
//  MainVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 15..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        
        
    }

}

extension MainVC {
    
    func getVC(_ id: String) -> UIViewController{
        return (storyboard?.instantiateViewController(withIdentifier: id))!
    }
    
}
