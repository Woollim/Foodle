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
    
    // FIXME: 실제로 쓰이는 함수가 아닌거 같은데, 사용하지 않는 코드는 그때그때 정리하는 습관이 좋습니다. 향후 재활용할 계획이 없다면요.
    func getVC(_ id: String) -> UIViewController{
        return (storyboard?.instantiateViewController(withIdentifier: id))!
    }
    
}
