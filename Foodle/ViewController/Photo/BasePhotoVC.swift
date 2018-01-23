//
//  BasePhotoVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 9..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit
import MobileCoreServices

class BasePhotoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()

    func addPhoto(){
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "카메라로 사진 찍기", style: .default, handler: openCamera(_:)))
        alert.addAction(UIAlertAction.init(title: "앨범에서 사진 가져오기", style: .default, handler: openAlbum(_:)))
        alert.addAction(UIAlertAction.init(title: "취소", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func openCamera(_ action: UIAlertAction){
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func getPhoto(_ image: UIImage){}
    
    func finishFunc(){}
    
    func openAlbum(_ action: UIAlertAction){
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        print(mediaType)
        
        if mediaType == (kUTTypeImage as NSString as String){
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            getPhoto(selectedImage)
        }
        picker.dismiss(animated: true, completion: finishFunc)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
