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
    
    var photoArr = Array<UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        (collectionView.collectionViewLayout as! RAReorderableLayout).scrollDirection = .horizontal
    }
    
    override func getPhoto(_ image: UIImage) {
        photoArr.append(image)
        collectionView.reloadData()
    }
    
    @IBAction func add(_ sender: Any) {
        addPhoto()
    }
    
}

extension SelectPhotoVC: RAReorderableLayoutDelegate, RAReorderableLayoutDataSource{
    
    func collectionView(_ collectionView: UICollectionView, at: IndexPath, didMoveTo toIndexPath: IndexPath) {
        let temp = photoArr[at.row]
        photoArr[at.row] = photoArr[toIndexPath.row]
        photoArr[toIndexPath.row] = temp
    }
    
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
        return photoArr.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.imageView.image = photoArr[indexPath.row]
        if indexPath.row == 0{ cell.addMailLabel() }
        return cell
    }
    
}


class PhotoCell: UICollectionViewCell{
    
    let imageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
    }
    
    func addMailLabel(){
        let label = UILabel.init(frame: CGRect.init(x: 10, y: contentView.frame.height - 8 - 24, width: 58, height: 24))
        label.text = "대표사진"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = UIColor.gray
        label.layer.cornerRadius = 4
        contentView.addSubview(label)
    }
    
    func setLayout(){
        imageView.frame = bounds
        contentView.addSubview(imageView)
    }
    
}

