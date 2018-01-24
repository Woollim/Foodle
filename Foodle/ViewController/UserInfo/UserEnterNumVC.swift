//
//  UserEnterNumVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 3..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit
import NexmoVerify

class UserEnterNumVC: UIViewController {

    @IBOutlet weak var countryNumButton: UIButton!
    @IBOutlet weak var userNumTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var checkNumLength = 10
    private var currentCountryNum = 0
    
    let countryCodeStrArr = ["KR", "JP", "US", "AU", "HK"]
    var alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "핸드폰 번호를\n확인해 주세요."
        countryNumButton.layer.cornerRadius = 8
        userNumTextField.delegate = self
        createAlert()
    }

    @IBAction func selectCountryNum(_ sender: UIButton) {
        present(alert, animated: true, completion: nil)
    }
    
    func alertClick(_ num: Int){
        let countryNumArr = ["+82", "+81", "+1", "+61", "+852"]
        currentCountryNum = num
        countryNumButton.setTitle(countryNumArr[num], for: .normal)
    }
    
    @IBAction func next(_ sender: UIButton) {
        let enterPinVC = storyboard?.instantiateViewController(withIdentifier: "UserEnterPinView") as! UserEnterPinVC
        enterPinVC.checkUserNum(countryCode: countryCodeStrArr[currentCountryNum], phoneNum: userNumTextField.text!)
        present(enterPinVC, animated: true, completion: nil)
    }
    
}

extension UserEnterNumVC: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nextButton.isEnabled = (textField.text!.lengthOfBytes(using: .utf8) > checkNumLength)
    }
    
    func createAlert(){
        let countryNameArr = ["한국", "日本", "United States", "Australia", "Hong Kong"]
        alert = UIAlertController.init(title: "국가를 선택하세요", message: nil, preferredStyle: .actionSheet)
        for i in 0..<countryNameArr.count{
            alert.addAction(UIAlertAction.init(title: countryNameArr[i], style: .default, handler: { _ in self.alertClick(i) }))
        }
        alert.addAction(UIAlertAction.init(title: "닫기", style: .cancel, handler: nil))
    }
    
}
