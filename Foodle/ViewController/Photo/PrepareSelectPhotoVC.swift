//
//  PrepareSelectPhotoVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 9..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class PrepareSelectPhotoVC: BasePhotoVC {
    
    var selectPhotoVC: SelectPhotoVC? = nil

    @IBAction func back(_ sender: Any) {}
    
    @IBAction func add(_ sender: Any) {
        addPhoto()
    }
    
    @IBAction func cancel(_ sender: Any) {}
    
    override func getPhoto(_ image: UIImage) {
        selectPhotoVC = storyboard?.instantiateViewController(withIdentifier: "SelectPhotoView") as? SelectPhotoVC
        selectPhotoVC?.photoArr.append(image)
    }
    
    override func finishFunc() {
        present(selectPhotoVC!, animated: true, completion: nil)
    }
    
}
