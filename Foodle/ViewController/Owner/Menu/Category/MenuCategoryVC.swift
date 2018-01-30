//
//  MenuCategoryVC.swift
//  Foodle
//
//  Created by Administrator on 2018. 1. 29..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit

class MenuCategoryVC: MenuOptionBaseEditVC {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedTextField: UITextField!
    @IBOutlet weak var endButton: UIButton!
    
    var foodName = "나와 평생을 함께 먹을래?"
    
    override func viewDidLoad() {
        initTableView(tableView)
        setSelectPart()
        titleLabel.text = "\(foodName)\n카테고리"
        option = .category
        contentArr = [("급식", ""), ("급식", ""), ("급식", ""), ("급식", "")]
    }
    
    @IBAction func back(){
        goBack()
    }
    
    func setSelectPart(){
        endButton.backgroundColor = Color.red.getColor()
        endButton.layer.cornerRadius = 8
        
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        selectedTextField.inputView = picker
    }
    
    @IBAction func endEditing(){
        view.endEditing(true)
    }
    
    override func goNext(_ data: (String, String)?) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: option.getNextVCId())
        present(nextVC!, animated: true, completion: nil)
    }
    
}

extension MenuCategoryVC: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contentArr[row].0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return contentArr.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTextField.text = contentArr[row].0
    }
    
}
