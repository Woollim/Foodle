//
//  SelectPhotoVC.swift
//  Foodle
//
//  Created by 이병찬 on 2018. 1. 8..
//  Copyright © 2018년 root. All rights reserved.
//

import UIKit
import RAReorderableLayout

class SelectPhotoVC: BasePhotoVC{
    
    @IBOutlet weak var collectionView: UICollectionView!
    let photoCellId = "PhotoCell"
    let addCellId = "AddCell"
    
    var photoArr = Array<UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: photoCellId, bundle: nil), forCellWithReuseIdentifier: photoCellId)
        collectionView.register(UINib.init(nibName: addCellId, bundle: nil), forCellWithReuseIdentifier: addCellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        (collectionView.collectionViewLayout as! RAReorderableLayout).scrollDirection = .horizontal
    }
    
    override func getPhoto(_ image: UIImage) {
        photoArr.append(image)
        collectionView.reloadData()
    }
    
    @IBAction func add() {
        addPhoto()
    }
    
    @IBAction func upload(){
        Connector.instance.uploadImage(add: "/photo", method: "POST", images: getImageModelArr())
    }
    
}

extension SelectPhotoVC: RAReorderableLayoutDelegate, RAReorderableLayoutDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 82.0, height: collectionView.frame.width - 82.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 16.0, 0, 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArr.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == photoArr.count{
            return collectionView.dequeueReusableCell(withReuseIdentifier: addCellId, for: indexPath)
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellId, for: indexPath) as! PhotoCell
        cell.imageView.image = photoArr[indexPath.row]
        cell.titleView.isHidden = (indexPath.row != 0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, at: IndexPath, didMoveTo toIndexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: toIndexPath) as! PhotoCell
        cell.titleView.isHidden = (at.row != 0)
        
        let temp = photoArr[at.row]
        photoArr[at.row] = photoArr[toIndexPath.row]
        photoArr[toIndexPath.row] = temp
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == photoArr.count{
            addPhoto()
        }else{
            removePhoto(indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, allowMoveAt indexPath: IndexPath) -> Bool {
        return indexPath.row < photoArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, at: IndexPath, canMoveTo: IndexPath) -> Bool {
        return canMoveTo.row < photoArr.count
    }
    
    func getImageModelArr() -> [ImageModel]{
        var imageArr = [ImageModel]()
        for index in 0..<photoArr.count{
            guard let image = ImageModel.init(key: "images", fileName: "\(index)mSendData", image: photoArr[index]) else{ continue }
            imageArr.append(image)
        }
        return imageArr
    }
    
    func removePhoto(_ indexPath: IndexPath){
        addAlert([UIAlertAction.init(title: "사진 삭제", style: .destructive){
            _ in
            self.photoArr.remove(at: indexPath.row)
            self.collectionView.deleteItems(at: [indexPath])
            (self.collectionView.cellForItem(at: indexPath) as! PhotoCell).titleView.isHidden = indexPath.row != 0
        }])
    }
    
}

