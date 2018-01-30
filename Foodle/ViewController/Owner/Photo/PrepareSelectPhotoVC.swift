//
//  PrepareSelectPhotoVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 9..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class PrepareSelectPhotoVC: BasePhotoVC {
    
    @IBOutlet weak var titleLabel: UILabel!
    var selectPhotoVC: SelectPhotoVC? = nil
    
    override func viewDidLoad() {
        titleLabel.text = "사진을 등록할\n준비가 되었나요?"
    }

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
