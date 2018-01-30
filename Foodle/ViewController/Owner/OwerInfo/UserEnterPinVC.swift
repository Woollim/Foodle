//
//  ViewController.swift
//  Foodle
//
//  Created by 이병찬 on 2017. 12. 30..
//  Copyright © 2017년 root. All rights reserved.
//

import UIKit
import NexmoVerify

class UserEnterPinVC: UIViewController {

    @IBOutlet weak var pinTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var stopIndicator: (() -> ())?
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func checkUserNum(countryCode: String, phoneNum: String){
        VerifyClient.getVerifiedUser(countryCode: countryCode, phoneNumber: phoneNum,
        onVerifyInProgress: {},
        onUserVerified: {
            self.showToast(msg: "성공")
        }, onError: {
            err in
            self.showToast(msg: "실패")
            self.pinTextField.text = ""
        })
    }
    
    @IBAction func next(_ sender: UIButton) {
        VerifyClient.checkPinCode(pinTextField.text!)
    }
    
    override func viewDidLoad() {
        pinTextField.delegate = self
    }

}


extension UserEnterPinVC: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nextButton.isEnabled = (textField.text!.lengthOfBytes(using: .utf8) > 3)
    }
    
}

